class Station
  attr_accessor :station_name
  attr_accessor :station_zone
  def initialize(name = 'Waterloo', zone = 1)
    @station_name = name
    @station_zone = zone
  end
end
