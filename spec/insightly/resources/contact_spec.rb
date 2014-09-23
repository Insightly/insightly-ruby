require 'spec_helper'

describe Insightly::Resources::Contact do
  subject(:contact) { Insightly.client.get_contact(id: 1) }

  describe 'instance' do
    it 'is decorated with Contact object' do
      expect(subject).to be_a(described_class)
    end

    %w(contact_id salutation first_name last_name background image_url default_linked_organisation
       visible_to visible_team_id visible_user_ids contact_field_1 contact_field_2 contact_field_3
       contact_field_4 contact_field_5 contact_field_6 contact_field_7 contact_field_8 contact_field_9
       contact_field_10 addresses contactinfos dates tags links contactlinks emaillinks).each do |method|
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
