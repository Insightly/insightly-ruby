require 'spec_helper'

describe Insightly2::Resources::Team do
  subject(:team) do
    VCR.use_cassette('get_team') do
      Insightly2.client.get_team(id: 2063767)
    end
  end

  describe 'instance' do
    it 'is decorated with Team object' do
      expect(subject).to be_a(described_class)
    end

    %w(team_id team_name anonymous_team date_created_utc date_updated_utc teammembers).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end

    %w(date_created_utc date_updated_utc).each do |method|
      it "deserialize attribute #{method} as time" do
        expect(subject.public_send(method)).to be_a(Time)
      end
    end
  end
end