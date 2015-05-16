module Mysql2QueryFilter::Plugin

  def self.register(name, klass)
    name = name.to_s
    @plugins ||= {}

    if @plugins.has_key?(name)
      raise "Plugin has already been registered: #{name}"
    end

    @plugins[name] = klass
  end

  def self.get(name)
    name = name.to_s
    p $:

    require "mysql2_query_filter/plugin/#{name}"

    plugin = @plugins[name]

    unless plugin
      raise "Plugin is not found: #{name}"
    end

    plugin
  end
end
