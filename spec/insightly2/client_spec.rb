require 'spec_helper'

describe Insightly2::Client do
  subject(:client) { Insightly2::Client.new }

  it 'makes request to api.insight.ly' do
    VCR.use_cassette('z_insightly_client_status_check') do
      response = client.request(:get, 'Users')
      expect(response.status).to eq(200)
    end
  end
end
