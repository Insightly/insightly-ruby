require 'insightly2'

module Insightly2
  module DSL
  end
end

require 'insightly2/dsl/comments'
require 'insightly2/dsl/contacts'
require 'insightly2/dsl/countries'
require 'insightly2/dsl/currencies'
require 'insightly2/dsl/custom_fields'
require 'insightly2/dsl/emails'
require 'insightly2/dsl/events'
require 'insightly2/dsl/file_attachments'
require 'insightly2/dsl/file_categories'
require 'insightly2/dsl/leads'
require 'insightly2/dsl/lead_statuses'
require 'insightly2/dsl/notes'
require 'insightly2/dsl/opportunities'
require 'insightly2/dsl/opportunity_categories'
require 'insightly2/dsl/opportunity_state_reasons'
require 'insightly2/dsl/organisations'
require 'insightly2/dsl/pipeline_stages'
require 'insightly2/dsl/pipelines'
require 'insightly2/dsl/project_categories'
require 'insightly2/dsl/projects'
require 'insightly2/dsl/relationships'
require 'insightly2/dsl/tags'
require 'insightly2/dsl/task_categories'
require 'insightly2/dsl/tasks'
require 'insightly2/dsl/team_members'
require 'insightly2/dsl/teams'
require 'insightly2/dsl/users'
require 'insightly2/utils'

module Insightly2
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
    include Leads
    include LeadSources
    include LeadStatuses
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
    include Utils
  end
end

