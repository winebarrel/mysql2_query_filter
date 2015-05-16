describe Mysql2QueryFilter do
  let(:client) { Mysql2::Client.new }

  context 'when using filters' do
    let(:filter1) do
      Class.new(Mysql2QueryFilter::Base) do
        def filter(sql, query_options); sql << ' through filter1'; end
      end
    end

    let(:filter2) do
      Class.new(Mysql2QueryFilter::Base) do
        def filter(sql, query_options); sql << ' through filter2'; end
      end
    end

    before do
      Mysql2QueryFilter.configure do |filter|
        filter.add filter1
        filter.add filter2
      end
    end

    it do
      expect(client).to receive(:query_without_filter).with('select 1 through filter1 through filter2')
      client.query('select 1')
    end
  end

  context 'when using a plug-in' do
    before do
      Mysql2QueryFilter.configure do |filter|
        filter.plugin :test
      end
    end

    it do
      expect(client).to receive(:query_without_filter).with('select 1 through plugin')
      client.query('select 1')
    end
  end
end
