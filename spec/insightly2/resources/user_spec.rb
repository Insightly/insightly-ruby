require 'spec_helper'

describe Insightly2::Resources::User do
  subject(:user) do
    VCR.use_cassette('get_user') do
      Insightly2.client.get_user(id: 607181)
    end
  end

  describe 'instance' do
    it 'is decorated with User object' do
      expect(subject).to be_a(described_class)
    end

    %w(user_id contact_id first_name last_name timezone_id email_address email_dropbox_identifier
       administrator account_owner active date_created_utc date_updated_utc user_currency contact_display
       contact_order task_week_start instance_id).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end
