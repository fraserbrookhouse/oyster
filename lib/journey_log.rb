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
    store_journey
  end
  

  private

  def store_journey
    @journeys.push(@current_journey.journey)
    @current_journey.journey = nil
  end

end
