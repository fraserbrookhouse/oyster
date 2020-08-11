require 'oystercard'

describe Oystercard do
    it 'has a balance' do
        expect(subject.balance).to eq(0)
    end 
    

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts an amount from the balance' do
      subject.top_up(5)
      expect { subject.deduct 5}.to change { subject.balance }.by(-5)
    end
 
  describe '#in_journey?' do
     
    it 'returns false by default' do
       expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do

    it 'starts the users journey' do
      subject.touch_in 
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_out' do

    it 'ends a users journey' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#top_up' do
    
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'raises an error if maximum balance reached' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up (maximum_balance)
      expect { subject.top_up 1 }.to raise_error 'Maximum balance of 90 reached'
     end
    end
end
 