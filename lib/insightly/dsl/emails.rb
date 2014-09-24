require 'insightly/dsl'

module Insightly
  module DSL::Emails
    # GET /v2.1/Emails?ids={ids}&tag={tag}
    # Gets a list of Emails.
    # @param [ids:] Array of email ids (optional).
    # @param [tag:] single tag (optional).
    def get_emails(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Email.parse(request(:get, "Emails/?ids=#{ids}&tag=#{tag}"))
    end

    # GET /v2.1/Emails/{id}
    # Gets an Email.
    # @param [id:] id of the email.
    def get_email(id:)
      Resources::Email.parse(request(:get, "Emails/#{id}"))
    end

    # DELETE /v2.1/Emails/{id}
    # Deletes an email.
    # @param [id:] id of the email.
    def delete_email(id:)
      request(:delete, "Emails/#{id}")
    end

    # GET /v2.1/Emails/{c_id}/Comments
    # Gets an Email's Comments.
    # @param [id:] id of the email.
    def get_email_comments(id:)
      Resources::Email.parse(request(:get, "Emails/#{id}/Comments"))
    end

    # POST /v2.1/Emails/{c_id}/Comments
    # Adds a Comment to an Email.
    # API is not well defined for this method.  Leaving this as a TODO.
    # https://api.insight.ly/v2.1/Help/Api/POST-Emails-c_id-Comments
  end
end
