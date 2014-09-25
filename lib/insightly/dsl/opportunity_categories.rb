require 'insightly/dsl'

module Insightly
  module DSL::OpportunityCategories
    # GET /v2.1/OpportunityCategories/{id}
    # Get an opportunity category.
    # @param [String, Fixnum] id An opportunity category's ID.
    # @return [Insightly::Resources::OpportunityCategory, nil].
    def get_opportunity_category(id:)
      Resources::OpportunityCategory.parse(request(:get, "OpportunityCategories/#{id}"))
    end

    # GET /v2.1/OpportunityCategories
    # Get a list of opportunity categories.
    # @return [Array, nil].
    def get_opportunity_categories
      Resources::OpportunityCategory.parse(request(:get, "OpportunityCategories"))
    end

    # POST /v2.1/OpportunityCategories
    # Create an opportunity category.
    # @param [Hash] category The opportunity category to create.
    # @return [Insightly::Resources::OpportunityCategory, nil].
    def create_opportunity_category(category:)
      Resources::OpportunityCategory.parse(request(:post, "OpportunityCategories", category))
    end

    # PUT /v2.1/OpportunityCategories
    # Update an opportunity category.
    # @param [Hash] category The opportunity category to update.
    # @return [Insightly::Resources::OpportunityCategory, nil].
    def update_opportunity_category(category:)
      Resources::OpportunityCategory.parse(request(:put, "OpportunityCategories", category))
    end

    # DELETE /v2.1/OpportunityCategories/{id}
    # Delete an opportunity category.
    # @param [String, Fixnum] id A OpportunityCategory's ID.
    # @return [RestClient::Response].
    def delete_opportunity_category(id:)
      request(:delete, "OpportunityCategories/#{id}")
    end
  end
end
