module Mysql2QueryFilter::Mysql2ClientExt
  def self.included(klass)
    klass.class_eval do
      alias query_without_filter query

      def query(*args)
        sql = args.first
        Mysql2QueryFilter.filter(sql, @query_options)
        query_without_filter(*args)
      end
    end
  end
end
