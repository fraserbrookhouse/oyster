require_relative 'journey'
require_relative 'journey_log'
require_relative 'station'

class Oystercard
  attr_reader :balance
  attr_accessor :journey_log
  attr_accessor :current_journey
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_log = Journey_Log.new
  end

  def top_up(money)
    raise 'Maximum balance of 90 reached' if money + balance > MAXIMUM_BALANCE

    @balance += money
  end

  def in_journey?
    if @journey_log.current_journey.entry_station
      true
    else
      false
    end
  end

  def touch_in(station)
    # raise 'Insufficient balance' if balance < MINIMUM_BALANCE

    # touch_out(nil) if @current_journey.entry_station
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.end_journey(station)
    deduct(@current_journey.fare)
    @current_journey.entry_station = nil
    @current_journey.exit_station = nil
    store_journey
    # self.deduct(MINIMUM_BALANCE)
  end

  private

  def deduct(money)
    @balance -= money
  end
end
