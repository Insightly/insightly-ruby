require 'spec_helper'

describe Insightly::Resources::Contact do
  subject(:contact) do
    VCR.use_cassette('get_contact') do
      Insightly.client.get_contact(id: 70653019)
    end
  end

  describe 'instance' do
    it 'is decorated with Contact object' do
      expect(subject).to be_a(described_class)
    end

    %w(contact_id salutation first_name last_name background image_url default_linked_organisation
       visible_to visible_team_id visible_user_ids addresses contactinfos dates tags links contactlinks emaillinks).each do |method|
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
