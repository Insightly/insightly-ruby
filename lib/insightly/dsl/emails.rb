require 'insightly/dsl'

module Insightly
  module DSL::Emails
    # GET /v2.1/Emails/{id}
    # Gets an email.
    # @param [String, Fixnum] id The ID of the email.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Email, nil]
    def get_email(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Email.parse(request(:get, "Emails/#{id}"))
    end

    # GET /v2.1/Emails/{c_id}/Comments
    # Gets an email's comments.
    # @param [String, Fixnum] id The ID of the email.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_email_comments(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
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
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_email(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Emails/#{id}")
    end
  end
end
