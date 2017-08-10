require 'oystercard.rb'

describe Oystercard do
  let(:station) { double :station }
  let(:journey) { double :journey }
  subject(:Oystercard) { described_class.new($MINV) }
  before do
    allow(Journey).to receive(:new) { journey }
    allow(journey).to receive(:exit_station=)
    allow(journey).to receive(:exit_station)
  end

  it 'check newly initialized card has a default balance of 0' do
    expect(subject.balance).to eq $MINV
  end

  it 'adds money to the balance' do
    subject.top_up(5)
    expect(subject.balance).to eq 6
  end

  it 'fails if new balance greater than limit' do
    expect { subject.top_up(90) }.to raise_error 'New balance exceeds #{MAXV}'
  end

  it 'fails if balance lower than min' do
    subject.send(:deduct, $MINV)
    expect { subject.touch_in(station) }.to raise_error 'Bal lower than #{MINV}'
  end

  it 'deducts fare from balance' do
    subject.send(:deduct, $MINV)
    expect(subject.balance).to eq 0
  end
  context do
    before do
      subject.touch_in(:entry_station => station)
    end
    it 'can be touched in' do
      allow(journey).to receive(:incomplete?) { true }
      expect(subject.in_journey?).to eq true
    end

    it 'can be touched out' do
      allow(journey).to receive(:incomplete?) { false }
      allow(journey).to receive(:fare) { $MINV }
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it 'can deduct fare on touch out' do
      allow(journey).to receive(:incomplete?) { true }
      allow(journey).to receive(:fare) { $MINV }
      expect { subject.touch_out(:exit_station => station) }.to change { subject.balance }.by(-$MINV)
    end
  end

  it 'has empty jouneys by default' do
    expect(subject.journeys).to eq []
  end

end
