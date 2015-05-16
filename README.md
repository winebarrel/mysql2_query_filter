# Mysql2QueryFilter

Filtering framework for [Mysql2](https://github.com/brianmario/mysql2).

[![Gem Version](https://badge.fury.io/rb/mysql2_query_filter.svg)](http://badge.fury.io/rb/mysql2_query_filter)
[![Build Status](https://travis-ci.org/winebarrel/mysql2_query_filter.svg?branch=master)](https://travis-ci.org/winebarrel/mysql2_query_filter)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mysql2_query_filter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mysql2_query_filter

## Usage

```ruby
require 'mysql2_query_filter'

class MyFilter < Mysql2QueryFilter::Base
  def filter(sql, client)
    p sql
    p client
  end
end

Mysql2QueryFilter.configure do |filter|
  filter.add MyFilter
end

Mysql2QueryFilter.enable!

client = Mysql2::Client.new(host: 'localhost', username: 'root')
client.query('show databases')
```

### Use plug-in

see [mysql2_query_filter-plugin-log](https://github.com/winebarrel/mysql2_query_filter-plugin-log).

```ruby
require 'mysql2_query_filter'

Mysql2QueryFilter.configure do |filter|
  filter.plugin :log #, out: $stderr
end

Mysql2QueryFilter.enable!

client = Mysql2::Client.new(host: 'localhost', username: 'root')
client.query('show databases')
```
