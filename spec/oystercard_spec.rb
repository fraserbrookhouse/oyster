require 'oystercard'

describe Oystercard do
  let(:station) { double :station }
  let(:journey) { { entry_station: station, exit_station: station } }
  it 'has a balance' do
    expect(subject.balance).to eq(0)
  end

  describe '#in_journey?' do
    it 'returns false by default' do
      expect(subject).not_to be_in_journey
    end
    it 'returns true if the is an entry station' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_in' do
    it 'starts the users journey' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it 'raises error if balance is less than minimum amount' do
      expect { subject.touch_in(station) }.to raise_error 'Insufficient balance'
    end
  end

  describe '#touch_out' do
    it 'ends a users journey' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it 'deducts money from balance' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'raises an error if maximum balance reached' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect { subject.top_up 1 }.to raise_error 'Maximum balance of 90 reached'
    end
  end
end
