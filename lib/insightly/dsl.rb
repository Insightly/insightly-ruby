require 'insightly'

module Insightly
  module DSL
  end
end

require 'insightly/dsl/comments'
require 'insightly/dsl/contacts'
require 'insightly/dsl/countries'
require 'insightly/dsl/currencies'
require 'insightly/dsl/custom_fields'
require 'insightly/dsl/emails'
require 'insightly/dsl/events'
require 'insightly/dsl/file_attachments'
require 'insightly/dsl/file_categories'
require 'insightly/dsl/notes'
require 'insightly/dsl/opportunities'
require 'insightly/dsl/opportunity_categories'
require 'insightly/dsl/opportunity_state_reasons'
require 'insightly/dsl/organisations'
require 'insightly/dsl/pipeline_stages'
require 'insightly/dsl/pipelines'
require 'insightly/dsl/project_categories'
require 'insightly/dsl/projects'
require 'insightly/dsl/relationships'
require 'insightly/dsl/tags'
require 'insightly/dsl/task_categories'
require 'insightly/dsl/tasks'
require 'insightly/dsl/team_members'
require 'insightly/dsl/teams'
require 'insightly/dsl/users'

module Insightly
  module DSL
    include Comments
    include Contacts
    include Countries
    include Currencies
    include CustomFields
    include Emails
    include Events
    include FileAttachments
    include FileCategories
    include Notes
    include Opportunities
    include OpportunityCategories
    include OpportunityStateReasons
    include Organisations
    include PipelineStages
    include Pipelines
    include ProjectCategories
    include Projects
    include Relationships
    include Tags
    include TaskCategories
    include Tasks
    include TeamMembers
    include Teams
    include Users
  end
end

