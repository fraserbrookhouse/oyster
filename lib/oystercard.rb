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
    if @journey_log.in_transit?
      true
    else
      false
    end
  end

  def touch_in(station)
    raise 'Insufficient balance' if balance < MINIMUM_BALANCE

    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.end(station)
    deduct(@journey_log.current_journey.fare)
  end

  private

  def deduct(money)
    @balance -= money
  end
end
