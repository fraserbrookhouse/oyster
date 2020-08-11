class Station 

end

class Oystercard
  attr_reader :balance
  attr_accessor :entry_station
  attr_accessor :exit_station
  attr_accessor :journey_list
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  @entry_station = nil
  @exit_station = nil
  

  def initialize
    @balance = 0
    @journey_list = []
  end

  def top_up(money)
    raise 'Maximum balance of 90 reached' if money + balance > MAXIMUM_BALANCE

    @balance += money
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
    @exit_station = nil
  end

  def touch_out(station)
    @in_journey = false
    @exit_station = station
    store_journey
    @entry_station = nil
    self.deduct(MINIMUM_BALANCE)
  end

  private 

  def store_journey
    journey  = {@entry_station => @exit_station}
    @journey_list
    @journey_list.push(journey)
    @journey_list
  end

  def deduct(money)
    @balance -= money
  end
end
