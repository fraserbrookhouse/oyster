require_relative 'journey'

class Journey_Log
  attr_accessor :journeys
  attr_accessor :current_journey
  
  def initialize
    @journeys = nil
    @current_journey = Journey.new
  end
end
