# Resugan::Rspec

RSpec helpers for the resugan event framework for ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'resugan-rspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resugan-rspec

## Usage

Wrap lines or objects that fire an event inside an expection block:

```ruby
  expect {
    _fire :an_event
  }.to fire :an_event
```

Use to_fire to check if the specified event is fired. That's it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/resugan-rspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
