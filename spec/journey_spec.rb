require 'journey.rb'

describe Journey do
  let(:station) { double :station }
  subject(:journey) { described_class.new({ :exit_station => station }) }

  it "set entry_station" do
    subject.entry_station = station
    expect(subject.entry_station).to eq station
  end

  it "sets exit_station" do
    expect(subject.exit_station).to eq station
  end

  it "checks journey is complete" do
    expect(subject.incomplete?).to eq true
  end

  it "calculates PENALTY fare" do
    expect(subject.fare).to eq($PENALTY)
  end

  it "calculates standard fare" do
    subject.entry_station = station
    expect(subject.fare).to eq($MINV)
  end

end
