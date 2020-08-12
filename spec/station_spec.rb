require 'station'

describe Station do
  it 'checks if class station exists' do
    expect(subject).to be_instance_of Station
  end
  it 'responds to station_name' do
    expect(subject).to respond_to(:station_name)
  end
  it 'responds to station_zone' do
    expect(subject).to respond_to(:station_zone)
  end
  it 'sets a station name' do
    station = Station.new('Euston')
    expect(station.station_name).to eq 'Euston'
  end
  it 'sets a station zone' do
    station = Station.new('Euston', 3)
    expect(station.station_zone).to eq 3
  end
end
