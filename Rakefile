require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: [:spec]

require_relative 'core/simple/container'

require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    Simple::Container.boot(:rom)
  end
end
