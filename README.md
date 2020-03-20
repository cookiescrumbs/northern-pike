# Northern Pike

Converts latitude,longitude to an OS map reference and an OS map reference to latitude,longitude

![Northern Pike](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Esox_lucius1.jpg/1200px-Esox_lucius1.jpg "Northern Pike")


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'northern_pike'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install northern_pike

## Usage

```
NorthernPike.os_reference_to_lat_lng(os_ref: 'HU260490')

{:lat=>60.22449375779038, :lng=>-1.5325017342359533}

NorthernPike.lat_lng_to_os_reference(lat: 60.22449375779038, lng: -1.5325017342359533)

{:os_map_ref=>"HU 26000 49000"}

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Steven/northern_pike.

