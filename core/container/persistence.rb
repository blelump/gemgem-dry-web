Simple::Container.namespace('persistence') do |container|
  container.register('persist_user') do
    container['persistence.rom'].command(:users)[:create]
  end
end
