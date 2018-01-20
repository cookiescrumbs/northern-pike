# Northern Pike

Chomps on some text containing OS Refs, titles and a descriptions for waters and spits out an array of waters containing a title, a descriptions and a lat,lng.

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
string_of_text = File.read(Dir.pwd + '/waters.txt')

northern_pike.chomp text: string_of_text, grid_letters: 'HU'

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Steven/northern_pike.

