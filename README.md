# Mat

A small (unofficial) API client for the [Mat API](http://matapi.se/).

The documentation is in Swedish, but so is the [data](http://www.slv.se/sv/grupp1/mat-och-naring/vad-innehaller-maten/livsmedelsdatabasen-/).

## Installation

Add this line to your application's Gemfile:

    gem 'mat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mat

## Usage

It is probably a good idea to take a look in `specs`

```ruby
# All nutrients
Mat.nutrients

# Find the first food with ’köttfärs’ in the name
köttfärspaj = Mat.all('Köttfärs').first

# Get the `iron` value
köttfärspaj.iron #=> 1.09

# Find a specific food by its number
food = Mat.find(3)
food.name #=> "Ister gris"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
