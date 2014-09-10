require 'spec_helper'

describe Insightly::Resources::Task do
  subject(:task) { Insightly.client.get_task(1) }

  describe 'instance' do
    it 'is decorated with Task object' do
      expect(subject).to be_a(described_class)
    end

    %w(task_id title category_id due_date completed_date_utc publicly_visible completed
       project_id details status priority percent_complete start_date assigned_by_user_id
       parent_task_id owner_visible responsible_user_id owner_user_id date_created_utc
       date_updated_utc tasklinks).each do |method|
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