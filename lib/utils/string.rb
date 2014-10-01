class String
  # Build a URL with a querystring containing optional params if supplied.
  # @param [Hash] params A hash of params we're turning into a querystring.
  # @return [String] The URL of the resource with required params.
  def build_url(params:)
    params.delete_if {|k,v| v.blank?}
    params = params.to_query
    self
    self << ("?" + params) unless params.blank?
  end
end