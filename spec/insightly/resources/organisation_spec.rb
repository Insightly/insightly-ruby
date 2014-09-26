require 'spec_helper'

describe Insightly::Resources::Organisation do
  subject(:organisation) { Insightly.client.get_organisation(id: 1) }

  describe 'instance' do
    it 'is decorated with Organisation object' do
      expect(subject).to be_a(described_class)
    end

    %w(organisation_id organisation_name background image_url owner_user_id date_created_utc
       date_updated_utc visible_to visible_team_id visible_user_ids customfields addresses
       contactinfos dates tags links organisationlinks emaillinks).each do |method|
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