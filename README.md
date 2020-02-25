# News Taxonomy

A dictionary style Gem which allows you to convert IAB-QTG and IPTC codes to english and back again.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'news_taxonomy', git: 'https://github.com/aylien/news_taxonomies_ruby.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install news_taxonomy

## Usage

To use the gem, simply require it in your ruby file and initialize the taxonomy you wish to use.


```
    iabqtg = NewsTaxonomy::IABQTG.new
    iptc   = NewsTaxonomy::IPTC.new 
```

All taxonomies respond to the method `.lookup` which will return the corresponding english or code depending on what you've submitted.

Alternatively, you can call the conversion methods directly.

```
<a>_to_<b>

def iptc_to_desc
def iabqtg_to_desc
def desc_to_iptc
def desc_to_iabqtg

```
If the result corresponding result cannot be found; it will default to the orignal variable given.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aylien/news_taxonomy.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
