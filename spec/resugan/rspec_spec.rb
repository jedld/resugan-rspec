require 'spec_helper'

describe Resugan::Rspec do
  it 'should match if an event has been fired' do
    expect {
      _fire :an_event
    }.to fire :an_event
  end

  it 'should check for params passed' do
    expect {
      _fire :an_event, params: 1
    }.to fire an_event: { 'params' => 1 }
  end

  it 'should not match if not event is fired' do
    begin
      expect {
        _fire :another_event
      }.to fire :an_event
      raise "fail"
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).to eq "expected to fire an_event but fired another_event"
    end
  end
end
