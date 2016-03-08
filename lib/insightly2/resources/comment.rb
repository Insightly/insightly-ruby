require 'insightly2/resources/object'
require 'insightly2/resources/file_attachment'

module Insightly2
  module Resources
    class Comment < Insightly2::Resources::Object
      # has_many :file_attachments, FileAttachment
    end
  end
end
