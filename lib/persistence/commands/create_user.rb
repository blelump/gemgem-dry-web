module Persistence
  module Commands
    class CreateUser < ROM::Commands::Create[:sql]
      input ::Simple::Types::Hash.schema(
        email: 'string', name: 'string', encrypted_password: 'string'
      )

      relation :users
      register_as :create
      result :one
    end
  end
end
