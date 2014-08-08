require 'insightly/resources'

module Insightly
  module Resources
    class User < Insightly::Object
      attribute :date_created_utc, Time
      attribute :date_updated_utc, Time
    end
  end
end
