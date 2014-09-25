require 'spec_helper'

describe Insightly::Resources::Opportunity do
  subject(:opportunity) { Insightly.client.get_opportunity(id: 1) }

  describe 'instance' do
    it 'is decorated with Opportunity object' do
      expect(subject).to be_a(described_class)
    end

    %w(opportunity_id opportunity_name opportunity_details probability bid_currency bid_amount
       bid_type bid_duration forecast_close_date category_id pipeline_id stage_id opportunity_state
       image_url responsible_user_id owner_user_id date_created_utc date_updated_utc visible_to
       visible_team_id visible_user_ids customfields tags links emaillinks).each do |method|
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