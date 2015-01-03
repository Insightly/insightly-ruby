require 'spec_helper'

describe Insightly2 do
  it 'has a version number' do
    expect(Insightly2::VERSION).not_to be nil
  end

  it 'provides way to set API key' do
    expect(Insightly2).to respond_to(:api_key)
  end

  it 'provides shortcut for instantiating Client' do
    expect(Insightly2.client).to be_a(Insightly2::Client)
  end
end
