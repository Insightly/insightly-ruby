require 'spec_helper'

describe Insightly::DSL::Tasks do
  # DELETE /v2.1/Tasks/{id}

  # GET /v2.1/Tasks/{c_id}/Comments

  # GET /v2.1/Tasks/{id}
  describe '#get_task' do
    it 'returns a task' do
      expect(Insightly.client.get_task(1)).to be_a(Insightly::Resources::Task)
    end
  end

  # GET /v2.1/Tasks?ids={ids}

  # POST /v2.1/Tasks

  # POST /v2.1/Tasks/{c_id}/Comments

  # PUT /v2.1/Tasks
end