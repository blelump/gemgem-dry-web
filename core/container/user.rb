Simple::Container.namespace('user') do |container|
  container.register('encrypt_password') do
    Entities::User::EncryptPassword.new
  end

  container.register('create') do
    Entities::User::Create
  end
end
