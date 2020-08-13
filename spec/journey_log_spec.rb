require 'journey_log'
describe Journey_Log do

  let(:journey) { double :journey } # this may need to have some methods
  let(:station) { double :station }
  let(:current_journey) {double :current_journey, new: journey}
  subject {described_class.new(current_journey: journey)}

  it 'should respond to journeys' do
    expect(subject).to respond_to(:journeys)
  end
  it 'should respond to current_journey' do
    expect(subject).to respond_to(:current_journey)
  end
  describe '#start' do
    it 'should start a journey' do
      expect(current_journey).to receive(:new).and_return journey
      subject.start(station)
    end
    it 'records a journey' do
      allow(current_journey).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journeys).to include journey
    end
  end
  describe '#finish' do
    
  end
end
