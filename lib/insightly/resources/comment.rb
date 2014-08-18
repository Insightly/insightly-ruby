require 'insightly/resources/object'
require 'insightly/resources/file_attachment'

module Insightly
  module Resources
    class Comment < Insightly::Resources::Object
      has_many :file_attachments, FileAttachment
    end
  end
end
