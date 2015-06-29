require 'insightly2/dsl'

module Insightly2
  module DSL::FileCategories
    # GET /v2.1/FileCategories/{id}
    # Get a file category.
    # @param [String, Fixnum] id: A file category's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::FileCategory, nil].
    def get_file_category(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::FileCategory.parse(request(:get, "FileCategories/#{id}"))
    end

    # GET /v2.1/FileCategories
    # Get a list of file categories.
    # @return [Array, nil].
    def get_file_categories
      Resources::FileCategory.parse(request(:get, "FileCategories"))
    end

    # POST /v2.1/FileCategories
    # Create a file category.
    # @param [Hash] category: File Category attributes.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::FileCategory, nil].
    def create_file_category(category: nil)
      raise ArgumentError, "Category cannot be blank" if category.blank?
      Resources::FileCategory.parse(request(:post, "FileCategories", category))
    end

    # PUT /v2.1/FileCategories
    # Update a file category.
    # @param [Hash] category: File Category attributes.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::FileCategory].
    def update_file_category(category: nil)
      raise ArgumentError, "Category cannot be blank" if category.blank?
      Resources::FileCategory.parse(request(:put, "FileCategories", category))
    end

    # DELETE /v2.1/FileCategories/{id}
    # Delete a file category.
    # @param [String, Fixnum] id: A file category's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_file_category(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "FileCategories/#{id}")
    end
  end
end
