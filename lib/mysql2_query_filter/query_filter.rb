class Mysql2QueryFilter::QueryFilter
  def initialize
    @filters = []
  end

  def plugin(name, options = {})
    filter_class = Mysql2QueryFilter::Plugins[name]
    append(filter_class, options)
  end

  def append(filter_class, options = {})
    unless filter_class < Mysql2QueryFilter::Plugin::Filter
      raise "Invalid plug-in has been appended: #{filter_class}"
    end

    @filters << filter_class.new(options)
  end

  def filter(sql, query_options)
    @filters.each do |fltr|
      fltr.filter(sql, query_options)
    end
  end
end
