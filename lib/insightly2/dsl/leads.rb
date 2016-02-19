require 'insightly2/dsl'

module Insightly2
  module DSL::Leads
    # GET /v2.1/Contacts/{id}
    # Gets a contact by id.
    # @param [String, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Contact, nil].
    def get_leads(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Lead.parse(request(:get, "Leads/#{id}"))
    end

    def get_leads(ids: [], email: '', tag: '')
      url = Utils::UrlHelper.build_url(path: "Leads", params: {ids: ids.join(','), email: email, tag: tag})
      Resources::Lead.parse(request(:get, url))
    end

  end
end
