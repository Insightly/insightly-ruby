require 'spec_helper'

describe Insightly::Client do
  subject(:client) { Insightly::Client.new }

  it 'makes request to api.insight.ly' do
    VCR.use_cassette('z_insightly_client_status_check') do
      response = client.request(:get, 'Users')
      expect(response.status).to eq(200)
    end
  end
end
