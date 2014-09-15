require 'spec_helper'

describe Insightly::DSL::Notes do
  # DELETE /v2.1/Notes/{id}
  describe '#delete_note' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_note(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Notes
  describe '#get_notes' do
    it 'returns an array of notes' do
      notes = Insightly.client.get_notes
      expect(notes).to be_a(Array)
      expect(notes.first).to be_a(Insightly::Resources::Note)
    end
  end

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