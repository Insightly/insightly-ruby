class String
  # Build a URL with a querystring containing optional params if supplied.
  # @param [String] resource The name of the resource as per the URL e.g. contacts
  # @param [Hash] params A hash of params we're turning into a querystring.
  # @return [String] The URL of the resource with required params.
  def self.build_url(resource:, params:)
    params.delete_if {|k,v| v.blank?}
    params = params.to_query
    query = resource
    query << ("/?" + params) unless params.blank?
  end
end