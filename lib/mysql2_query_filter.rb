require 'mysql2'

require 'mysql2_query_filter/version'

require 'mysql2_query_filter/mysql2_client_ext'
require 'mysql2_query_filter/plugin'
require 'mysql2_query_filter/plugin/filter'
require 'mysql2_query_filter/query_filter'

Mysql2::Client.class_eval do
  include Mysql2QueryFilter::Mysql2ClientExt
end

module Mysql2QueryFilter
  @@query_filter = Mysql2QueryFilter::QueryFilter.new
  @@enabled = false

  def self.configure
    yield(@@query_filter)
  end

  def self.filter(sql, query_options)
    @@query_filter.filter(sql, query_options) if @@enabled
  end

  def self.enable!
    @@enabled = true
  end

  def self.disable!
    @@enabled = false
  end
end
