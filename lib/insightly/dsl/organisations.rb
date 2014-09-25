require 'insightly/dsl'

module Insightly
  module DSL::Organisations
    # DELETE /v2.1/Organisations/{c_id}/Image
    # @param [String, Fixnum] id An organisation's ID
    def delete_organisation_image(id:)
      request(:delete, "Organisations/#{id}/Image")
    end

    # DELETE /v2.1/Organisations/{id}
    # @param [String, Fixnum] id An organisation's ID
    def delete_organisation(id:)
      request(:delete, "Organisations/#{id}")
    end

    # GET /v2.1/Organisations/{c_id}/Emails
    # @return [Insightly::Resources::Organisation]
    # @param [String, Fixnum] id An organisation's ID
    def get_organisation_emails(id:)
      Resources::Organisation.parse(request(:get, "Organisations/#{id}/Emails"))
    end

    # GET /v2.1/Organisations/{c_id}/Image
    # @return [Insightly::Resources::Organisation]
    # @param [String, Fixnum] id An organisation's ID
    def get_organisation_image(id:)
      Resources::Organisation.parse(request(:get, "Organisations/#{id}/Image"))
    end

    # GET /v2.1/Organisations/{c_id}/Notes
    # @return [Insightly::Resources::Organisation]
    # @param [String, Fixnum] id An organisation's ID
    def get_organisation_notes(id:)
      Resources::Organisation.parse(request(:get, "Organisations/#{id}/Notes"))
    end

    # GET /v2.1/Organisations/{c_id}/Tasks
    # @return [Insightly::Resources::Organisation]
    # @param [String, Fixnum] id An organisation's ID
    def get_organisation_tasks(id:)
      Resources::Organisation.parse(request(:get, "Organisations/#{id}/Tasks"))
    end

    # GET /v2.1/Organisations/{id}
    # @return [Insightly::Resources::Organisation]
    # @param [String, Fixnum] id An organisation's ID
    def get_organisation(id:)
      Resources::Organisation.parse(request(:get, "Organisations/#{id}"))
    end

    # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}
    # @param [Array] ids Organisation's IDs
    # @param [String] domain Email domain
    # @param [String] tag A single tag
    # @return [<Insightly::Resources::Organisation>, nil]
    def get_organisations(ids: [], domain: '', tag: '')
      ids = ids.join(',')
      Resources::Organisation.parse(request(:get, "Organisations?ids=#{ids}&domain=#{domain}&tag=#{tag}"))
    end

    # POST /v2.1/Organisations
    # @param [Hash] organization A hash of organization attributes
    # @return [Insightly::Resources::Organisation]
    def create_organisation(organisation:)
      Resources::Organisation.parse(request(:post, "Organisations", organisation))
    end

    # POST /v2.1/Organisations/{c_id}/Image/{filename}
    # @param [Hash] organization A hash of organization attributes
    # @return [Insightly::Resources::Organisation]
    def create_organisation_image(id:, filename:)
      request(:post, "Organisations/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Organisations
    # @param [Hash] organization A hash of organization attributes
    # @return [Insightly::Resources::Organisation]
    def update_organisation(organisation:)
      Resources::Organisation.parse(request(:put, "Organisations", organisation))
    end

    # PUT /v2.1/Organisations/{c_id}/Image/{filename}
    # @param [Hash] organization A hash of organization attributes
    # @return [Insightly::Resources::Organisation]
    def update_organisation_image(id:, filename:)
      request(:put, "Organisations/#{id}/Image/#{filename}")
    end
  end
end
