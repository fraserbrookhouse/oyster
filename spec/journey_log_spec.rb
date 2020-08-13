require 'journey_log'

describe Journey_Log do
  let(:station) { double :station }
  it 'should respond to journeys' do
    expect(subject).to respond_to(:journeys)
  end
  it 'should respond to current_journey' do
    expect(subject).to respond_to(:current_journey)
  end

  describe '#start' do
    it 'adds an entry station' do
      subject.start(station)
      expect(subject.current_journey.entry_station).to eq station
    end
  end

  describe '#end' do
    it 'adds an exit station' do
      subject.start(station)
      subject.end(station)
      expect(subject.current_journey.exit_station)
    end
  end
end
