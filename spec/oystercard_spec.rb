require 'oystercard.rb'

describe Oystercard do
  let(:station) { double :station }
  default_value = 1
  subject(:Oystercard) { described_class.new(default_value) }

  it 'check newly initialized card has a default balance of 0' do
    expect(subject.balance).to eq default_value
  end

  it 'adds money to the balance' do
    subject.top_up(5)
    expect(subject.balance).to eq 6
  end

  it 'fails if new balance greater than limit' do
    expect { subject.top_up(90) }.to raise_error 'New balance exceeds #{MAX_VALUE}'
  end

  it 'fails if new balance lower than min' do
    subject.send(:deduct, default_value)
    expect { subject.touch_in(:station) }.to raise_error 'New balance lower than #{MIN_VALUE}'
  end

  it 'deducts fare from balance' do
    subject.send(:deduct, default_value)
    expect(subject.balance).to eq 0
  end

  it 'can be touched in' do
    subject.touch_in(:station)
    expect(subject.in_journey?).to eq true
  end

  it 'can be touched out' do
    subject.touch_in(:station)
    subject.touch_out(default_value)
    expect(subject.in_journey?).to eq false
  end

  it 'can deduct fare on touch out' do
    subject.touch_in(:station)
    expect { subject.touch_out(default_value) }.to change { subject.balance }.by(-default_value)
  end

  it 'can remember the entry station on touch in' do
    subject.touch_in(:station)
    expect(subject.entry_station).to eq :station
  end
end
