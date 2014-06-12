describe Wisper::Invokers::Celluloid do
  before { $thread_id = Thread.current.object_id }

  class MyPublisher
    include Wisper::Publisher

    def ping
      broadcast(:pong)
    end
  end

  class MyListener
    def pong
      $thread_id = Thread.current.object_id
      puts Thread.current.object_id
      sleep(5)
    end
  end

  # for sanity...
  describe 'without Invoker::Celluloid' do
    it 'is slow without celluloid invoker' do
      pub = MyPublisher.new
      pub.add_listener(MyListener.new)
      duration = time { pub.ping }
      expect(duration).to be > 4
    end

    it 'is executed in the same thread' do
      pub = MyPublisher.new
      pub.add_listener(MyListener.new)
      pub.ping
      expect(Thread.current.object_id).to eq($thread_id)
    end
  end

  it 'returns quickly with celluloid invoker' do
    pub = MyPublisher.new
    pub.add_listener(MyListener.new, invoker: Wisper::Invokers::Celluloid.new)
    duration = time { pub.ping }
    expect(duration).to be < 1
  end

  # failing sometimes... (order dependent)
  it 'is executed in a different thread' do
    pub = MyPublisher.new
    pub.add_listener(MyListener.new, invoker: Wisper::Invokers::Celluloid.new)
    pub.ping
    expect(Thread.current.object_id).to_not eq($thread_id)
  end

  def time(&block)
    start = Time.now
    yield
    Time.now - start
  end
end
