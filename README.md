# Mat

A small (unofficial) API client for the [Mat API](http://matapi.se/).

The documentation is in Swedish, but so is the [data](http://www.slv.se/sv/grupp1/mat-och-naring/vad-innehaller-maten/livsmedelsdatabasen-/).

[![Build Status](https://travis-ci.org/peterhellberg/mat.png?branch=master)](https://travis-ci.org/peterhellberg/mat)

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
# Find the first food with ’köttfärs’ in the name
food = Mat.all('Köttfärs').first

# You can also pass a search query to the find method
food = Mat.find('Köttfärs')

# Get the `iron` value (method_missing is used to retrieve each nutrient)
food.iron #=> 1.09

# Find a specific food by its number
food = Mat.find(3)
food.name #=> "Ister gris"

# You can also list all nutrients
Mat.nutrients
```

### CLI

This gem comes with a simple command line interface.

```ruby
# Finding foodstuff by its number
$ mat 55
{
  "name": "Mimosasallad",
  "number": 55,
  "nutrientValues": {
    "energyKj": 651,
    "energyKcal": 156,
    "protein": 2.4,
    "fat": 12,
    "carbohydrates": 8.9,
    "fibres": 1.8,
    "salt": 0.1,
    "ash": 0.6,
    "water": 74.2,
    "alcohol": 0,
    "monosaccharides": 3.3,
    "disaccharides": 4.5,
    "saccharose": 4.2,
    "wholegrain": 0,
    "saturatedFattyAcids": 3.8,
    "fattyAcid40100": 0.5,
    "fattyAcid120": 0.1,
    "fattyAcid140": 0.5,
    "fattyAcid160": 1.9,
    "fattyAcid180": 0.7,
    "fattyAcid200": 0,
    "monounsaturatedFattyAcids": 2.6,
    "fattyAcid161": 0.1,
    "fattyAcid181": 2.5,
    "sumPolyunsaturatedFattyAcids": 4.4,
    "n6FattyAcids": 0.1,
    "fattyAcid182": 3.9,
    "fattyAcid204": 0,
    "n3FattyAcids": 0,
    "fattyAcid183": 0.5,
    "longN3FattyAcids": 0,
    "epa": 0,
    "dpa": 0,
    "dha": 0,
    "transFattyAcids": 0.1,
    "cholesterol": 50.3,
    "retinolEquivalents": 76,
    "retinol": 68,
    "betacarotene": 92,
    "vitaminD": 0.15,
    "vitaminE": 1.24,
    "vitaminK": 3,
    "timamine": 0.09,
    "riboflavin": 0.1,
    "vitaminC": 12,
    "niacin": 0.5,
    "niacinEquivalents": 1,
    "vitaminB6": 0.1,
    "vitaminB12": 0.23,
    "phosphorous": 55,
    "folate": 23,
    "iodine": 4,
    "trash": 17,
    "iron": 0.54,
    "calcium": 31,
    "potassium": 199,
    "magnesium": 13,
    "sodium": 45,
    "selenium": 2.3,
    "zink": 0.4
  }
}

# You can also search for foodstuff
$ mat hasselnötter
[
  {
    "name": "Hasselnötter",
    "number": 1558
  },
  {
    "name": "Mjölkchoklad m hackade hasselnötter Schweizernöt",
    "number": 1848
  }
]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
