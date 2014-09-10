require 'spec_helper'

describe Insightly::Resources::Team do
  subject(:team) { Insightly.client.get_team(1) }

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