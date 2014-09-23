require 'spec_helper'

describe Insightly::Resources::Comment do
  subject(:comment) { Insightly.client.get_comment(id: 1) }

  describe 'instance' do
    it 'is decorated with Comment object' do
      expect(subject).to be_a(described_class)
    end

    %w(comment_id body owner_user_id file_attachments).each do |method|
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