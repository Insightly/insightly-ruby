require 'insightly/dsl'

module Insightly
  module DSL::Notes
    # GET /v2.1/Notes/{id}
    # Get a note.
    # @param [String, Fixnum] id A note's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Note, nil].
    def get_note(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Note.parse(request(:get, "Notes/#{id}"))
    end

    # GET /v2.1/Notes/{c_id}/Comments
    # Gets the comments attached to a note.
    # @param [String, Fixnum] id A note's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_note_comments(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Comment.parse(request(:get, "Notes/#{id}/Comments"))
    end

    # GET /v2.1/Notes
    # Get a list of notes.
    # @return [Insightly::Resources::Note, nil].
    def get_notes
      Resources::Note.parse(request(:get, "Notes"))
    end

    # POST /v2.1/Notes
    # Creates a note.
    # @param [Hash] note The note to create.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Note, nil].
    def create_note(note:)
      raise ArgumentError, "Note cannot be nil" if note.nil?
      Resources::Note.parse(request(:post, "Notes", note))
    end

    # POST /v2.1/Notes/{c_id}/Comments
    # API is not well defined.
    # https://api.insight.ly/v2.1/Help/Api/POST-Notes-c_id-Comments

    # POST /v2.1/Notes?c_id={c_id}&filename={filename}
    # Adds a File Attachment to a Note.
    # @param [String|Fixnum] id A Note's ID.
    # @param [String] filename The name of the file.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def create_note_file(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:post, "Notes?c_id=#{id}&filename=#{filename}")
    end

    # PUT /v2.1/Notes
    # Updates a note.
    # @param [Hash] note The note to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Note, nil].
    def update_note(note:)
      raise ArgumentError, "Note cannot be nil" if note.nil?
      Resources::Note.parse(request(:put, "Notes", note))
    end

    # DELETE /v2.1/Notes/{id}
    # @param [String, Fixnum] id A note's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_note(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Notes/#{id}")
    end
  end
end
