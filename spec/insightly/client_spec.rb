require 'spec_helper'

describe Insightly::Client do
  subject(:client) { Insightly::Client.new }

  it 'make request to api.insight.ly' do
    expect(client.request(:get, 'Users')).to be_a(Net::HTTPOK)
  end
end
