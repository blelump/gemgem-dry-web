require 'entities/user'

module Persistence
  module Repositories
    class Users < ROM::Repository
      relations :users

      def [](id)
        users.where(id: id).as(Entities::User).one
      end

      def by_email(email)
        users.where(email: email).as(Entities::User).first
      end
    end
  end
end
