require 'webmock/rspec'
require 'insightly'
require 'vcr'
include Insightly::Resources

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
cnf = YAML::load_file(File.join(APP_ROOT, 'config/gem_secret.yml'))
insightly_api_key = cnf['insightly_api_key']

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<INSIGHTLY_API_KEY>') { insightly_api_key }
end

RSpec.configure do |config|
  config.before do
    Insightly.api_key = insightly_api_key
  end
end
