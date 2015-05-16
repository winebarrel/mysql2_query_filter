class Mysql2QueryFilter::Base
  def initialize(options)
    @options = options.dup
  end

  def filter(sql, query_options)
  end
end
