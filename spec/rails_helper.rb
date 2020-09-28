require 'coveralls'
Coveralls.wear_merged!('rails')

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'webmock/rspec'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include ResponseJSON
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.filter_gems_from_backtrace('webmock')
  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.before do
    stub_request(:get, "https://brottsplatskartan.se/api/events/?location=Visby").
      to_return(status: 200, body: file_fixture('visby_crime_index.json'), headers: {})
    stub_request(:get, "https://brottsplatskartan.se/api/events/?location=iogyoiybviibuibu").
      to_return(status: 200, body: file_fixture('no_search_results.json'), headers: {})
  end
end