require 'insightly/dsl'

module Insightly
  module DSL::Organisations
    # DELETE /v2.1/Organisations/{c_id}/Image

    # DELETE /v2.1/Organisations/{id}
    # @param [String, Fixnum] id A Organisation's ID
    def delete_organisation(id)
      request(:delete, "Organisations/#{id}")
    end

    # GET /v2.1/Organisations/{c_id}/Emails

    # GET /v2.1/Organisations/{c_id}/Image

    # GET /v2.1/Organisations/{c_id}/Notes

    # GET /v2.1/Organisations/{c_id}/Tasks

    # GET /v2.1/Organisations/{id}
    # @return [Insightly::Resources::Organisation]
    # @param [String, Fixnum] id A Organisation's ID
    def get_organisation(id)
      Resources::Organisation.parse(request(:get, "Organisations/#{id}"))
    end

    # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}
    # @param [Hash] options
    # @option options :ids [Array]
    # @option options :domain [String]
    # @option options :tag [String]
    # @return [<Insightly::Resources::Organisation>, nil]
    def get_organisations(options = {})
      Resources::Organisation.parse(request(:get, 'Organisations', options))
    end

    # POST /v2.1/Organisations

    # POST /v2.1/Organisations/{c_id}/Image/{filename}

    # PUT /v2.1/Organisations

    # PUT /v2.1/Organisations/{c_id}/Image/{filename}
  end
end
