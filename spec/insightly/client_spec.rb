require 'spec_helper'

describe Insightly::Client do
  subject(:client) { Insightly::Client.new }

  it 'make request to api.insight.ly' do
    response = client.request(:get, 'Users')
    expect(response.code).to eq(200)
  end
end
