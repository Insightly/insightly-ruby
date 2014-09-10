require 'insightly/resources/object'
require 'insightly/resources/file_attachment'

module Insightly
  module Resources
    class Comment < Insightly::Resources::Object
      has_many :fileattachments, FileAttachment
    end
  end
end
