SPEC_ROOT = File.expand_path('../..', __FILE__)
$LOAD_PATH.unshift File.join(SPEC_ROOT, 'lib')
require 'webmock/rspec'
require 'insightly'

RSpec.configure do |config|
  config.before do
    stub_request(:any, /#{Regexp.escape('https://api.insight.ly/v2.1/')}(.+)/).to_return(
      body: lambda { |request|
        file_name = File.join(SPEC_ROOT, 'spec/fixtures', "#{request.uri.path.gsub('/v2.1/', '').downcase}.json")
        File.read(file_name)
      }
    )
  end
end
