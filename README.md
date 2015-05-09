# Mysql2QueryFilter

Filtering framework for [Mysql2](https://github.com/brianmario/mysql2).

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

class MyFilter < Mysql2QueryFilter::Plugin::Filter
  def filter(sql, query_options)
    p sql
    p query_options
  end
end

Mysql2QueryFilter.configure do |filter|
  filter.append MyFilter
end

Mysql2QueryFilter.enable

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

Mysql2QueryFilter.enable

client = Mysql2::Client.new(host: 'localhost', username: 'root')
client.query('show databases')
```
