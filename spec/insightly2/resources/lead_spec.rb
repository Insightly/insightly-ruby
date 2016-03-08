require 'spec_helper'

describe Insightly2::Resources::Lead do
  subject(:lead) do
    VCR.use_cassette('get_lead') do
      Insightly2.client.get_lead(id: 7246484)
    end
  end

  describe 'instance' do
    it 'is decorated with Lead object' do
      expect(subject).to be_a(described_class)
    end

    %w(lead_id salutation title first_name last_name organization_name phone_number mobile_phone_number fax_number
       email_address website_url owner_user_id date_created_utc date_updated_utc
       converted converted_date_utc converted_contact_id converted_organization_id converted_opportunity_id visible_to
       responsible_user_id industry lead_status_id lead_source_id visible_team_id employee_count lead_rating lead_description
       visible_user_ids customfields address_street address_city address_state address_postcode address_country
       tags email_links event_links task_links note_links file_attachments image_url).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end
