require_relative 'db_helper'

require 'rack/test'

require SPEC_ROOT.join('../core/boot').realpath

RSpec.configure do |config|
  config.before(:suite) do
    Simple::Application.freeze
  end

  config.include Rack::Test::Methods, type: :request
end
