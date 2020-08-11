class Station
  attr_accessor :station_name
  attr_accessor :station_zone
  def initialize(name = 'no_name', zone = 0)
    @station_name = name
    @station_zone = zone
  end
end
