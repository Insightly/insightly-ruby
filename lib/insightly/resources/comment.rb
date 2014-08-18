require 'insightly/resources'
require 'insightly/resources/file_attachment'

module Insightly
  module Resources
    class Comment < Insightly::Object
      has_many :file_attachments, FileAttachment
    end
  end
end
