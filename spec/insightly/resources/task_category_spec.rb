require 'spec_helper'

describe Insightly::Resources::TaskCategory do
  subject(:task_category) { Insightly.client.get_task_category(1) }

  describe 'instance' do
    it 'is decorated with TaskCategory object' do
      expect(subject).to be_a(described_class)
    end

    %w(category_id category_name active background_color).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end