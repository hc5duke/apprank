# Apprank

Get iOS app rank data from Apple.

# Installation

To install, add apprank to your @Gemfile@ and run `bundle install`:

```
gem 'apprank'
```

## Demo

```
require 'apprank'
json = open('http://itunes.apple.com/us/rss/topfreeapplications/limit=25/json')
rank = Apprank::Rank.new(json)
rank.apps.first.name # => "Some popular free app name"
```
