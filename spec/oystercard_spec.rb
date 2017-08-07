require 'oystercard.rb'

describe Oystercard do
  subject(:Oystercard) { described_class.new }
  it "check newly initialized card has a default balance of 0" do
    expect(subject.balance).to eq 0
  end
end
