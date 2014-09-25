require 'insightly/dsl'

module Insightly
  module DSL::Emails
    # GET /v2.1/Emails/{id}
    # Gets an email.
    # @param [String, Fixnum] id The ID of the email.
    # @return [Insightly::Resources::Email, nil]
    def get_email(id:)
      Resources::Email.parse(request(:get, "Emails/#{id}"))
    end

    # GET /v2.1/Emails/{c_id}/Comments
    # Gets an email's comments.
    # @param [String, Fixnum] id The ID of the email.
    # @return [Array, nil].
    def get_email_comments(id:)
      Resources::Comment.parse(request(:get, "Emails/#{id}/Comments"))
    end

    # GET /v2.1/Emails?ids={ids}&tag={tag}
    # Gets a list of Emails.
    # @param [Array] ids The list of email IDs (optional).
    # @param [String] tag Emails tagged with this tag (optional).
    # @return [Array, nil].
    def get_emails(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Email.parse(request(:get, "Emails/?ids=#{ids}&tag=#{tag}"))
    end

    # POST /v2.1/Emails/{c_id}/Comments
    # Adds a Comment to an Email.
    # TODO - API is not well defined for this method.
    # https://api.insight.ly/v2.1/Help/Api/POST-Emails-c_id-Comments

    # DELETE /v2.1/Emails/{id}
    # Deletes an email.
    # @param [String, Fixnum] id The ID of the email to delete.
    # @return [RestClient::Response].
    def delete_email(id:)
      request(:delete, "Emails/#{id}")
    end
  end
end
