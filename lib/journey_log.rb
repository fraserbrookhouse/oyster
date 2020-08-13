require_relative 'journey'

class Journey_Log
  attr_accessor :journeys
  attr_accessor :current_journey
  
  def initialize(current_journey: )
    @journeys = nil
    @current_journey = Journey
  end

  def start(station)
    current_journey.new
end
