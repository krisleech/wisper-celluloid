require 'pathname'

module Wisper
  describe CelluloidBroadcaster do
    FILE_PATH = Pathname(File.dirname(__FILE__)).join('test_file')
    SLEEP_FOR = 2

    after do
      system("rm #{FILE_PATH}") if File.exist?(FILE_PATH)
    end

    let(:publisher) { MyPublisher.new }

    class MyPublisher
      include Wisper::Publisher

      def ping
        broadcast(:pong)
      end
    end

    class MyListener
      def pong
        touch_file
        sleep(SLEEP_FOR)
      end

      private

      def touch_file
        File.open(FILE_PATH, 'w') { |file| file.write(Thread.current.object_id) }
      end
    end

    # for sanity...
    describe 'without CelluloidBroadcaster' do
      it "takes longer than #{SLEEP_FOR} seconds" do
        publisher.subscribe(MyListener.new)
        duration = time { publisher.ping }
        expect(duration).to be > SLEEP_FOR
        expect(file_touched?).to eql true
        expect(file_thread_id).to eql Thread.current.object_id.to_s
      end
    end

    it "takes less than #{SLEEP_FOR} seconds" do
      publisher.subscribe(MyListener.new, async: subject)
      duration = time { publisher.ping }
      expect(duration).to be < SLEEP_FOR
      expect(file_touched?).to eql true
      expect(file_thread_id).to_not eql Thread.current.object_id.to_s
    end

    def time(&block)
      start = Time.now
      yield
      Time.now - start
    end

    def file_touched?
      resolution = 0.1
      (SLEEP_FOR / resolution).to_i.times do
        return true if File.exist?(FILE_PATH)
        sleep(resolution)
      end
      return false
    end

    def file_thread_id
      File.read(FILE_PATH)
    end
  end
end
