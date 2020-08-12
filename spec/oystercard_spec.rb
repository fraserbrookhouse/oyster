require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    expect(subject.balance).to eq(0)
  end

  it 'has no journeys' do
    expect(subject.journey_list.count).to eq(0)
  end

  describe '#in_journey?' do
    it 'returns false by default' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    let(:station) { double :station }
    let(:journey) { { entry_station: station, exit_station: station } }
    it 'starts the users journey' do
      subject.top_up(20)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it 'raises error if balance is less than minimum amount' do
      expect { subject.touch_in(station) }.to raise_error 'Insufficient balance'
    end

    it 'sets exit_station to nil' do
      subject.top_up(20)
      subject.touch_in(station)
      subject.touch_out(station)
      subject.touch_in(station)
      expect(subject.exit_station).to eq nil
    end
  end

  describe '#touch_out' do
    let(:station) { double :station }

    it 'ends a users journey' do
      subject.top_up(20)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it 'sets entry_station to nil' do
      subject.top_up(20)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.entry_station).to eq nil
    end
    it 'deducts money from balance' do
      subject.top_up(20)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end

    it 'adds journey to journey list' do
      subject.top_up(20)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.journey_list.count }.by 1
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'raises an error if maximum balance reached' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error 'Maximum balance of 90 reached'
    end
  end
end
