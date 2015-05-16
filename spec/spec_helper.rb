$: << File.expand_path('..', __FILE__)

pp $:

require 'mysql2_query_filter'

RSpec.configure do |config|
  config.before(:all) do
    Mysql2QueryFilter.enable!
  end

  config.before(:each) do
    Mysql2QueryFilter.clear!
  end
end
