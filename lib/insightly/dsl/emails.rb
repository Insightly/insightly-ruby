require 'insightly/dsl'

module Insightly
  module DSL::Emails
    # DELETE /v2.1/Emails/{id}
    # @param [String, Fixnum] id A Email's ID
    def delete_email(id)
      request(:delete, "Emails/#{id}")
    end

    # GET /v2.1/Emails/{c_id}/Comments

    # GET /v2.1/Emails/{id}
    # @return [Insightly::Resources::Email]
    # @param [String, Fixnum] id A Email's ID
    def get_email(id)
      Resources::Email.parse(request(:get, "Emails/#{id}"))
    end

    # GET /v2.1/Emails?ids={ids}&tag={tag}
    # @return [<Insightly::Resources::Email>, nil]
    def get_emails
      Resources::Email.parse(request(:get, 'Emails'))
    end

    # POST /v2.1/Emails/{c_id}/Comments
  end
end
