require 'spec_helper'

describe Insightly::Resources::TeamMember do
  subject(:team_member) { Insightly.client.get_team_member(1) }

  describe 'instance' do
    it 'is decorated with TeamMember object' do
      expect(subject).to be_a(described_class)
    end

    %w(permission_id team_id member_user_id member_team_id).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end