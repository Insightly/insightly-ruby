require 'spec_helper'

describe Insightly::DSL::Countries do
  # GET /v2.1/Countries
  describe '#get_countries' do
    it 'returns an array of countries' do
      countries = Insightly.client.get_countries
      expect(countries).to be_a(Array)
      expect(countries.first).to be_a(Insightly::Resources::Country)
    end
  end
end