require 'spec_helper'

describe Insightly::DSL::Projects do
  # DELETE /v2.1/Projects/{c_id}/Image

  # DELETE /v2.1/Projects/{id}

  # GET /v2.1/Projects/{c_id}/Emails

  # GET /v2.1/Projects/{c_id}/Image

  # GET /v2.1/Projects/{c_id}/Notes

  # GET /v2.1/Projects/{c_id}/Tasks

  # GET /v2.1/Projects/{id}
  describe '#get_project' do
    it 'returns a project' do
      expect(Insightly.client.get_project(1)).to be_a(Insightly::Resources::Project)
    end
  end

  # GET /v2.1/Projects?ids={ids}&tag={tag}

  # POST /v2.1/Projects

  # POST /v2.1/Projects/{c_id}/Image/{filename}

  # PUT /v2.1/Projects

  # PUT /v2.1/Projects/{c_id}/Image/{filename}
end