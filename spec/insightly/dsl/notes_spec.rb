require 'spec_helper'

describe Insightly::DSL::Notes do
  # DELETE /v2.1/Notes/{id}

  # GET /v2.1/Notes

  # GET /v2.1/Notes/{c_id}/Comments

  # GET /v2.1/Notes/{id}
  describe '#get_note' do
    it 'returns a note' do
      expect(Insightly.client.get_note(1)).to be_a(Insightly::Resources::Note)
    end
  end

  # POST /v2.1/Notes

  # POST /v2.1/Notes/{c_id}/Comments

  # POST /v2.1/Notes?c_id={c_id}&filename={filename}

  # PUT /v2.1/Notes
end