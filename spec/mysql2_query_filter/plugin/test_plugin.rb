module Mysql2QueryFilter::Plugin
  class Test < Mysql2QueryFilter::Base
    Mysql2QueryFilter::Plugin.register(:test, self)

    def filter(sql, query_options)
      sql << ' through plugin'
    end
  end
end
