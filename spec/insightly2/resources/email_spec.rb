require 'spec_helper'

describe Insightly2::Resources::Email do
  subject(:email) do
    VCR.use_cassette('get_email') do
      Insightly2.client.get_email(id: 17683283)
    end
  end

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

    %w(date_created_utc).each do |method|
      it "deserialize attribute #{method} as time" do
        expect(subject.public_send(method)).to be_a(Time)
      end
    end
  end
end