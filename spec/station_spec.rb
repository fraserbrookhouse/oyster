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
end
