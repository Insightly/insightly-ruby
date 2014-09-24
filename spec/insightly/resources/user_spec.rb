require 'spec_helper'

describe Insightly::Resources::User do
  subject(:user) { Insightly.client.get_user(id: 1) }

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

    %w(date_created_utc date_updated_utc).each do |method|
      it "deserialize attribute #{method} as time" do
        expect(subject.public_send(method)).to be_a(Time)
      end
    end
  end
end
