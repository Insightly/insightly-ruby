require 'insightly/dsl'

module Insightly
  module DSL::Notes
    # DELETE /v2.1/Notes/{id}
    # @param [String, Fixnum] id A Note's ID
    def delete_note(id)
      request(:delete, "Notes/#{id}")
    end

    # GET /v2.1/Notes
    # @return [<Insightly::Resources::Note>, nil]
    def get_notes
      Resources::Note.parse(request(:get, 'Notes'))
    end

    # GET /v2.1/Notes/{c_id}/Comments

    # GET /v2.1/Notes/{id}
    # @return [Insightly::Resources::Note]
    # @param [String, Fixnum] id A Note's ID
    def get_note(id)
      Resources::Note.parse(request(:get, "Notes/#{id}"))
    end

    # POST /v2.1/Notes

    # POST /v2.1/Notes/{c_id}/Comments

    # POST /v2.1/Notes?c_id={c_id}&filename={filename}

    # PUT /v2.1/Notes
  end
end
