class Oystercard
  attr_reader :balance
  attr_accessor :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  @entry_station = nil
  def initialize
    @balance = 0
  end

  def top_up(money)
    raise 'Maximum balance of 90 reached' if money + balance > MAXIMUM_BALANCE

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    if @entry_station.nil?
      false
    else
      true
    end
  end

  def touch_in(station)
    raise 'Insufficient balance' if balance < MINIMUM_BALANCE

    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    @entry_station = nil
  end
end
