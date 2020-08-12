require 'journey_log'

describe Journey_Log do
  it 'should respond to journeys' do
    expect(subject).to respond_to(:journeys)
  end
  it 'should respond to current_journey' do
    expect(subject).to respond_to(:current_journey)
  end
  describe '#start' do
    
  end
  describe '#finish' do
  
  end
end
