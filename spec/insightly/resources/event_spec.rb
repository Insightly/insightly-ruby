require 'spec_helper'

describe Insightly::Resources::Event do
  subject(:event) { Insightly.client.get_event(1) }

  describe 'instance' do
    it 'is decorated with Event object' do
      expect(subject).to be_a(described_class)
    end

    %w(event_id title location details start_date_utc end_date_utc all_day publicly_visible
       reminder_date_utc reminder_sent eventlinks owner_user_id date_created_utc
       date_updated_utc).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end

    %w(start_date_utc end_date_utc reminder_date_utc date_created_utc date_updated_utc).each do |method|
      it "deserialize attribute #{method} as time" do
        expect(subject.public_send(method)).to be_a(Time)
      end
    end
  end
end