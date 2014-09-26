require 'spec_helper'

describe Insightly::DSL::Notes do
  # GET /v2.1/Notes/{id}
  describe '#get_note' do
    it 'returns a note' do
      expect(Insightly.client.get_note(id: 1)).to be_a(Note)
    end
  end

  # GET /v2.1/Notes
  describe '#get_notes' do
    it 'returns an array of notes' do
      notes = Insightly.client.get_notes
      expect(notes).to be_a(Array)
      expect(notes.first).to be_a(Note)
    end
  end

  # GET /v2.1/Notes/{c_id}/Comments
  # TODO

  # POST /v2.1/Notes
  describe '#create_note' do
    it 'creates and returns a note' do
      expect(Insightly.client.create_note(note: {})).to be_a(Note)
    end
  end

  # POST /v2.1/Notes/{c_id}/Comments
  # TODO

  # POST /v2.1/Notes?c_id={c_id}&filename={filename}
  describe '#create_note_file' do
    it 'adds attachment to the note' do
      response = Insightly.client.create_note_file(id: 1, filename: '')
      expect(response.code).to eq(200)
    end
  end

  # PUT /v2.1/Notes
  describe '#update_note' do
    it 'updates and returns a note' do
      expect(Insightly.client.update_note(note: {id: 1})).to be_a(Note)
    end
  end

  # DELETE /v2.1/Notes/{id}
  describe '#delete_note' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_note(id: 1)
      expect(response.code).to eq(202)
    end
  end
end