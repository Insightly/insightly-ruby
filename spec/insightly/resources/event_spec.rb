require 'spec_helper'

describe Insightly2::Resources::Event do
  subject(:event) do
    VCR.use_cassette('get_event') do
      Insightly2.client.get_event(id: 2402366)
    end
  end

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

    %w(date_created_utc date_updated_utc).each do |method|
      it "deserialize attribute #{method} as time" do
        expect(subject.public_send(method)).to be_a(Time)
      end
    end
  end
end