require 'bcrypt'
require 'dry/types'

module Entities
  class User < Dry::Types::Struct
    class EncryptPassword
      include BCrypt

      def call(input)
        Password.create(input)
      end

      def same?(hash, password)
        Password.new(hash) == password
      end
    end
  end
end
