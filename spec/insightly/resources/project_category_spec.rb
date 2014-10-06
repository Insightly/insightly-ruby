require 'spec_helper'

describe Insightly::Resources::ProjectCategory do
  subject(:project_category) do
    VCR.use_cassette('get_project_category') do
      Insightly.client.get_project_category(id: 1947441)
    end
  end

  describe 'instance' do
    it 'is decorated with ProjectCategory object' do
      expect(subject).to be_a(described_class)
    end

    %w(category_id category_name active background_color).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end