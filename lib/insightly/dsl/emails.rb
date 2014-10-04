require 'insightly/dsl'

module Insightly
  module DSL::Emails
    # GET /v2.1/Emails/{id}
    # Gets an email.
    # @param [String, Fixnum] id The ID of the email.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Email, nil]
    def get_email(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Email.parse(request(:get, "Emails/#{id}"))
    end

    # GET /v2.1/Emails/{c_id}/Comments
    # Gets an email's comments.
    # @param [String, Fixnum] id The ID of the email.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_email_comments(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Comment.parse(request(:get, "Emails/#{id}/Comments"))
    end

    # GET /v2.1/Emails?ids={ids}&tag={tag}
    # Gets a list of Emails.
    # @param [Array] ids The list of email IDs (optional).
    # @param [String] tag Emails tagged with this tag (optional).
    # @return [Array, nil].
    def get_emails(ids: [], tag: '')
      url = Utils::UrlHelper.build_url(path: "Emails", params: {ids: ids.join(','), tag: tag})
      Resources::Email.parse(request(:get, url))
    end

    # POST /v2.1/Emails/{c_id}/Comments
    # Create a comment for a task.
    # @param [String, Fixnum] id A task's ID.
    # @param [Hash] comment The comment to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Comment, nil].
    def create_email_comments(id:, comment:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      raise ArgumentError, "Comment cannot be blank" if comment.blank?
      Resources::Comment.parse(request(:post, "Emails/#{id}/Comments", comment))
    end

    # DELETE /v2.1/Emails/{id}
    # Deletes an email.
    # @param [String, Fixnum] id The ID of the email to delete.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_email(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "Emails/#{id}")
    end
  end
end
