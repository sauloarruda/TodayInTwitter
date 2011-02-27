require 'rspec'
require 'webrat'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Rack::Test::Methods
  config.include Webrat::Methods
  config.include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body
end

Webrat.configure do |config|
  config.mode = :rack
end

def app
  Sinatra::Application
end