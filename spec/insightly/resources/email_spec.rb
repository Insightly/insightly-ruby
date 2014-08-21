require 'spec_helper'

describe Insightly::Resources::Email do
  subject(:email) { Insightly.client.get_email(1) }

  describe 'instance' do
    it 'is decorated with Email object' do
      expect(subject).to be_a(described_class)
    end

    %w(email_id gmail_message_id email_date_utc email_from email_to email_cc subject body format size
       owner_user_id date_created_utc visible_to visible_team_id visible_user_ids
       file_attachments emaillinks).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end

    %w(email_date_utc date_created_utc).each do |method|
      it "deserialize attribute #{method} as time" do
        expect(subject.public_send(method)).to be_a(Time)
      end
    end
  end
end