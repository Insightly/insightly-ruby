require 'spec_helper'

describe Insightly::Resources::Project do
  subject(:project) { Insightly.client.get_project(1) }

  describe 'instance' do
    it 'is decorated with Project object' do
      expect(subject).to be_a(described_class)
    end

    %w(project_id project_name status project_details opportunity_id started_date completed_date
       image_url responsible_user_id owner_user_id date_created_utc date_updated_utc category_id
       pipeline_id stage_id visible_to visible_team_id visible_user_ids customfields tags links
       emaillinks).each do |method|
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