require 'equalizer'
require 'dry/types'

module Entities
  class User < Dry::Types::Struct
    include Equalizer.new(:id, :name, :email, :encrypted_password)

    attribute :id, 'int'
    attribute :name, 'string'
    attribute :email, 'string'
    attribute :encrypted_password, 'string'
  end
end
