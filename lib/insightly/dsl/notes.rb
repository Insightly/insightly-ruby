require 'insightly/dsl'

module Insightly
  module DSL::Notes
    # DELETE /v2.1/Notes/{id}
    # @param [String, Fixnum] id A Note's ID
    def delete_note(id:)
      request(:delete, "Notes/#{id}")
    end

    # GET /v2.1/Notes
    # @return [<Insightly::Resources::Note>, nil]
    def get_notes
      Resources::Note.parse(request(:get, 'Notes'))
    end

    # GET /v2.1/Notes/{c_id}/Comments
    # Gets a the Comments attached to a Note.
    # @param [String, Fixnum] id A Note's ID
    def get_note_comments(id:)
      Resources::Note.parse(request(:get, "Notes/#{id}/Comments"))
    end

    # GET /v2.1/Notes/{id}
    # @return [Insightly::Resources::Note]
    # @param [String, Fixnum] id A Note's ID
    def get_note(id:)
      Resources::Note.parse(request(:get, "Notes/#{id}"))
    end

    # POST /v2.1/Notes
    # Creates a note.
    # @param [Hash] note: Note attributes.
    def create_note(note:)
      Resources::Note.parse(request(:post, "Notes", note))
    end

    # POST /v2.1/Notes/{c_id}/Comments
    # API is not well defined.
    # https://api.insight.ly/v2.1/Help/Api/POST-Notes-c_id-Comments

    # POST /v2.1/Notes?c_id={c_id}&filename={filename}
    # Adds a File Attachment to a Note.
    # @param [String|Fixnum] id A Note's ID.
    # @param [String] filename The name of the file.
    def create_note_file(id:, filename:)
      request(:post, "Notes?c_id=#{id}&filename=#{filename}")
    end

    # PUT /v2.1/Notes
    # Updates a note.
    # @param [Hash] note Note attributes.
    def update_note(note:)
      Resources::Note.parse(request(:put, "Notes", note))
    end
  end
end
