require 'insightly'

module Insightly
  module DSL
  end
end

require 'insightly/dsl/users'
require 'insightly/dsl/comments'

module Insightly
  module DSL
    include Users
    include Comments
  end
end
