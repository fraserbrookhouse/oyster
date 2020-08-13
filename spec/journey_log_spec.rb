require 'journey_log'

describe Journey_Log do
  let(:station) { double :station }
  let(:journey) { { entry_station: station, exit_station: station } }

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
    it 'adds current_journey to journeys' do
      expect{ subject.end(station) }.to change { subject.journeys.count }.by 1
    end
  end
  describe '#in_transit?' do
    it 'returns false by default' do
      expect(subject.in_transit).not_to be_in_transit
    end
    it 'returns true after touching in' do
      subject.start(station)
      expect(subject.in_transit).to be_in_transit
    end
  end
end
