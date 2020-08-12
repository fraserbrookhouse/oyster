require_relative 'journey'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance
  attr_accessor :entry_station
  attr_accessor :exit_station
  attr_accessor :journey_list
  attr_accessor :current_journey
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_list = []
    @current_journey = Journey.new
  end

  def top_up(money)
    raise 'Maximum balance of 90 reached' if money + balance > MAXIMUM_BALANCE

    @balance += money
  end

  def in_journey?
    if @current_journey.entry_station
      true
    else
      false
    end
  end

  def touch_in(station)
    raise 'Insufficient balance' if balance < MINIMUM_BALANCE

    touch_out(nil) if @current_journey.entry_station
    @current_journey.start_journey(station)
  end

  def touch_out(station)
    @current_journey.end_journey(station)
    deduct(@current_journey.fare)
    @current_journey.entry_station = nil
    @current_journey.exit_station = nil
    store_journey
    # self.deduct(MINIMUM_BALANCE)
  end

  private

  def store_journey
    @journey_list.push(@current_journey.journey)
    @current_journey.journey = nil
  end

  def deduct(money)
    @balance -= money
  end
end
