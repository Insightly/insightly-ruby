require 'spec_helper'

describe Insightly::DSL::Countries do
  # GET /v2.1/Countries
  describe '#get_countries' do
    it 'returns an array of countries' do
      VCR.use_cassette('get_countries') do
        countries = Insightly.client.get_countries
        expect(countries).to be_a(Array)
        expect(countries.first).to be_a(Country)
      end
    end
  end
end