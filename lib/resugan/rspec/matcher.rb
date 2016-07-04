RSpec::Matchers.define :fire do |*event_list|
  match do |context|
    context = if context.is_a? Proc
      resugan { context.call }
    else
      context
    end

    duplicate_hash = {}
    events = context.dump
    events.keys.each do |e|
      duplicate_hash[e.to_sym] = events[e]
    end

    event_list.each do |e|
      if e.is_a? Hash
        return false if !duplicate_hash[e.keys.first.to_sym]
      else
        return false if !duplicate_hash.keys.include?(e.to_sym)
      end
    end
    true
  end

  failure_message do |actual|
    context = if actual.is_a? Proc
      resugan { actual.call }
    else
      actual
    end
    "expected to fire #{event_list.join(',')} but fired #{context.dump.empty? ? 'nothing' : context.dump.keys.join(',')}"
  end

  failure_message_when_negated do |actual|
    context = if actual.is_a? Proc
      resugan { actual.call }
    else
      actual
    end

    "expected not to fire #{event_list.join(',')} but fired #{context.dump.empty? ? 'nothing' : context.dump.keys.join(',')}"
  end

  # Optional method description
  description do
    "checks if certain resugan events are fired"
  end

  supports_block_expectations
end
