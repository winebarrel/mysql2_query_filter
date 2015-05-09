class Mysql2QueryFilter::Plugin::Filter
  def initialize(options)
    @options = options.dup
  end

  def filter(sql)
  end
end
