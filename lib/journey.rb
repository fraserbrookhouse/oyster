require_relative 'station'
require_relative 'oystercard'
class Journey
  attr_accessor :entry_station, :exit_station, :journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey = nil
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
    @journey = { entry_station: @entry_station, exit_station: @exit_station }
    self
  end

  def fare
    if @entry_station && @exit_station
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end

  def complete?
    true if @exit_station && @entry_station
  end
end
