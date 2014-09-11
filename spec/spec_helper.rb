SPEC_ROOT = File.expand_path('../..', __FILE__)
$LOAD_PATH.unshift File.join(SPEC_ROOT, 'lib')
require 'webmock/rspec'
require 'insightly'
require 'active_support/inflector'

RSpec.configure do |config|
  config.before do
    file_name = File.join(SPEC_ROOT, 'spec/fixtures')
    base_url = 'https://api.insight.ly/v2.1/'
    api_version = '/v2.1/'
    file_extension = '.json'
    stub_request(:get, /#{Regexp.escape(base_url)}(.+)/).to_return(
      body: lambda { |request|
        file_name += "/GET/#{request.uri.path.gsub(api_version, '').underscore.downcase}#{file_extension}"
        File.read(file_name)
      }
    )
    stub_request(:post, /#{Regexp.escape(base_url)}(.+)/).to_return(
      body: lambda { |request|
        file_name += "/POST/#{request.uri.path.gsub(api_version, '').underscore.downcase}#{file_extension}"
        File.read(file_name)
      }
    )
    stub_request(:put, /#{Regexp.escape(base_url)}(.+)/).to_return(
      body: lambda { |request|
        file_name += "/PUT/#{request.uri.path.gsub(api_version, '').underscore.downcase}#{file_extension}"
        File.read(file_name)
      }
    )
    stub_request(:delete, /#{Regexp.escape(base_url)}(.+)/).to_return(
      body: lambda { |request|
        file_name += "/DELETE/#{request.uri.path.gsub(api_version, '').underscore.downcase}#{file_extension}"
        File.read(file_name)
      }
    )
  end
end
