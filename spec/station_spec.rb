require 'station'

describe Station do
  it 'checks if class station exists' do
    expect(subject).to be_instance_of Station
  end
  it 'responds to name with 1 argument' do
    expect(subject).to respond_to(:station_name)
  end
end
