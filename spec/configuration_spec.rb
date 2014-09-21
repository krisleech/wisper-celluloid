require 'wisper/celluloid'

RSpec.describe 'configuration' do
  let(:configuration) { Wisper.configuration }

  it 'adds celluloid to broadcasters' do
    expect(configuration.broadcasters).to include :celluloid
  end

  it 'adds celluloid as async broadcaster' do
    expect(configuration.broadcasters[:async]).to be_an_instance_of(Wisper::CelluloidBroadcaster)
  end
end
