ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'rspec'
require File.expand_path '../../application.rb', __FILE__

module TestApplication
  def app
    Application
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include TestApplication
end