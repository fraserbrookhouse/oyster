require 'journey'

describe Journey do
  let(:station) { double :station, station_zone: 1 }

  it 'has an entry station' do
    subject.start_journey(station)
    expect(subject.entry_station). to eq station
  end

  it 'has an exit station' do
    subject.end_journey(station)
    expect(subject.exit_station). to eq station
  end

  describe '#fare' do
    it 'charges the penalty fare by default' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'calculates a fare when given stations' do
      subject.start_journey(station)
      subject.end_journey(station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end
  end

  describe '#complete?' do
    it 'knows if a journey is not complete' do
      expect(subject).not_to be_complete
    end
    it 'knows if a journey is complete' do
      subject.start_journey(station)
      subject.end_journey(station)
      expect(subject).to be_complete
    end
  end

  describe '#start_journey' do
    it 'sets entry_station' do
      subject.start_journey(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#end_journey' do
    it 'returns itself when a journey is finished' do
      expect(subject.end_journey(station)).to eq subject
    end
  end

  describe '#reset' do
    it 'sets entry_station to nil' do
      subject.start_journey(station)
      subject.end_journey(station)
      subject.reset
      expect(subject.entry_station).to eq nil
    end
    it 'sets exit_station to nil' do
      subject.start_journey(station)
      subject.end_journey(station)
      subject.reset
      expect(subject.exit_station).to eq nil
    end
  end
end
