require 'spec_helper'

describe Insightly2::DSL::Notes do
  let(:note_id) { 15377334 }

  # GET /v2.1/Notes/{id}
  describe '#get_note' do
    it 'returns a note' do
      VCR.use_cassette('get_note') do
        expect(Insightly2.client.get_note(id: note_id)).to be_a(Note)
      end
    end
  end

  # GET /v2.1/Notes
  describe '#get_notes' do
    it 'returns an array of notes' do
      VCR.use_cassette('get_notes') do
        notes = Insightly2.client.get_notes
        expect(notes).to be_a(Array)
        expect(notes.first).to be_a(Note)
      end
    end
  end

  # GET /v2.1/Notes/{c_id}/Comments
  describe '#get_note_comments' do
    it 'returns a notes comments' do
      VCR.use_cassette('get_note_comments') do
        notes = Insightly2.client.get_note_comments(id: note_id)
        expect(notes).to be_a(Array)
        expect(notes.first).to be_a(Comment)
      end
    end
  end

  # POST /v2.1/Notes
  describe '#create_note' do
    it 'creates and returns a note' do
      VCR.use_cassette('create_note') do
        note = Insightly2.client.get_note(id: note_id)
        expect(Insightly2.client.create_note(note: note)).to be_a(Note)
      end
    end
  end

  # POST /v2.1/Notes/{c_id}/Comments
  describe '#create_note_comment' do
    it 'creates a comment for a note' do
      VCR.use_cassette('create_note_comment') do
        response = Insightly2.client.create_note_comment(id: note_id, comment: {title: 'Look out!'})
        expect(response.status).to eq(201)
      end
    end
  end

  # POST /v2.1/Notes?c_id={c_id}&filename={filename}
  describe '#create_note_file' do
    it 'creates an attachment for a note' do
      VCR.use_cassette('create_note_file') do
        response = Insightly2.client.create_note_file(id: note_id, filename: '1.jpg')
        expect(response.status).to eq(201)
      end
    end
  end

  # PUT /v2.1/Notes
  describe '#update_note' do
    it 'updates and returns a note' do
      VCR.use_cassette('update_note') do
        note = Insightly2.client.get_note(id: note_id)
        expect(Insightly2.client.update_note(note: note)).to be_a(Note)
      end
    end
  end

  # DELETE /v2.1/Notes/{id}
  describe '#delete_note' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_note') do
        response = Insightly2.client.delete_note(id: note_id)
        expect(response.status).to eq(202)
      end
    end
  end
end