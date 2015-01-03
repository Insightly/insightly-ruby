require 'spec_helper'

describe Insightly2::Resources::Note do
  subject(:note) do
    VCR.use_cassette('get_note') do
      Insightly2.client.get_note(id: 15377334)
    end
  end

  describe 'instance' do
    it 'is decorated with Note object' do
      expect(subject).to be_a(described_class)
    end

    %w(note_id title body link_subject_id link_subject_type owner_user_id date_created_utc
       date_updated_utc visible_to visible_team_id visible_user_ids file_attachments
       notelinks).each do |method|
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