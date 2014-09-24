require 'insightly/dsl'

module Insightly
  module DSL::FileCategories
    # DELETE /v2.1/FileCategories/{id}
    # @param [String, Fixnum] id: A file category's ID
    def delete_file_category(id:)
      request(:delete, "FileCategories/#{id}")
    end

    # GET /v2.1/FileCategories
    # @return [<Insightly::Resources::FileCategory>, nil]
    def get_file_categories
      Resources::FileCategory.parse(request(:get, 'FileCategories'))
    end

    # GET /v2.1/FileCategories/{id}
    # @return [Insightly::Resources::FileCategory]
    # @param [String, Fixnum] id: A file category's ID
    def get_file_category(id:)
      Resources::FileCategory.parse(request(:get, "FileCategories/#{id}"))
    end

    # POST /v2.1/FileCategories
    # @return [Insightly::Resources::FileCategory]
    # @param [Hash] category: File Category attributes.
    def create_file_category(category:)
      Resources::FileCategory.parse(request(:post, "FileCategories", category))
    end

    # PUT /v2.1/FileCategories
    # @return [Insightly::Resources::FileCategory]
    # @param [Hash] category: File Category attributes.
    def update_file_category(category:)
      Resources::FileCategory.parse(request(:put, "FileCategories", category))
    end
  end
end
