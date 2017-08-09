require 'station.rb'

describe Station do

  subject(:station) { described_class.new(:Kings_Cross, 1) }
  it 'creates station with name' do
    expect(subject.name).to eq :Kings_Cross
  end
  it 'creates station with zone' do
    expect(subject.zone).to eq 1
  end
end
