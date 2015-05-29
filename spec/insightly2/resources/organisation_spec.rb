require 'spec_helper'

describe Insightly2::Resources::Organisation do
  subject(:organisation) do
    VCR.use_cassette('get_organisation') do
      Insightly2.client.get_organisation(id: 39831139)
    end
  end

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
  end
end
