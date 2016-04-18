require_relative 'simple/container'

Simple::Container.finalize! do |container|
  # Register your additional dependencies used by the web app
  #
  # In example a logger:
  #
  # require 'logger'
  # container.register(:logger, Logger.new(container.root.join("log/#{container.config.env}.log")))

  require 'simple/functions'
  require 'trailblazer'
  require 'trailblazer/operation/model'
  require 'trailblazer/operation/representer'
  require 'representable/json'
  require 'reform/form/dry'
end

require 'simple/application'
