require 'rom'
require 'rom-repository'

Simple::Container.namespace('persistence') do |container|
  config = ROM::Configuration.new(:sql, container.options.database_url)

  container.register('config', config)

  container.require('core/container/persistence')

  container.auto_register!('lib/persistence/repositories') do |repo|
    -> { repo.new(container['persistence.rom']) }
  end

  container.finalize(:rom) do
    config.auto_registration(container.root.join('lib/persistence'))
    container.register('rom', ROM.container(config))
  end
end
