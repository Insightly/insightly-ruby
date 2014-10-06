require 'spec_helper'

describe Insightly::DSL::Countries do
  # GET /v2.1/Currencies
  describe '#get_currencies' do
    it 'returns an array of currencies' do
      VCR.use_cassette('get_currencies') do
        currencies = Insightly.client.get_currencies
        expect(currencies).to be_a(Array)
        expect(currencies.first).to be_a(Currency)
      end
    end
  end
end