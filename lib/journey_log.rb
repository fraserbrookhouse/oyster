require_relative 'journey'

class Journey_Log
  attr_reader :journeys
  attr_accessor :current_journey
  
  def initialize
    @journeys = []
    @current_journey = Journey.new
  end

  def start(station)
    @current_journey.start_journey(station)
  end

  def end(station)
    @current_journey.end_journey(station)
  end

end
