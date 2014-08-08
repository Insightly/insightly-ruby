require 'insightly'

module Insightly
  module DSL
  end
end

require 'insightly/dsl/users'

module Insightly
  module DSL
    include Users
  end
end
