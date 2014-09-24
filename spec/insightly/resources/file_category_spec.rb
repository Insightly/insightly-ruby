require 'spec_helper'

describe Insightly::Resources::FileCategory do
  subject(:file_category) { Insightly.client.get_file_category(id: 1) }

  describe 'instance' do
    it 'is decorated with FileCategory object' do
      expect(subject).to be_a(described_class)
    end

    %w(category_id category_name active background_color).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end