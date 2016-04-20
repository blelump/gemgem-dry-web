require 'simple/import'

module Entities
  class User < Dry::Types::Struct
    class Create < Trailblazer::Operation
      include Trailblazer::Operation::Model
      include Trailblazer::Operation::Representer
      include Trailblazer::Operation::Representer::Deserializer::Hash

      contract do
        feature Reform::Form::Dry::Validations

        property :name
        property :email
        property :password, virtual: true
        property :encrypted_password

        validation :default do
          key(:name) { |value| value.filled? }
          key(:email) { |value| value.filled? }
          key(:password) { |value| value.filled? }
        end
      end

      representer do
        property :id
        property :name
        property :email
      end

      def process(params)
        validate(params) do |f|
          @model = CreateUser.new.call(f)
        end
      end

      def to_json(*)
        super(exclude: [:password, :encrypted_password])
      end

      private

      def model!(params)
        OpenStruct.new
      end

      class CreateUser
        include Simple::Functions
        include Simple::Import(
          'user.encrypt_password',
          'persistence.persist_user'
        )

        def call(f)
          params = prepare_attributes(t(:symbolize_keys)[f.to_nested_hash])
          Entities::User.new(persist_user.(params))
        end

        def prepare_attributes(params)
          params.merge(encrypted_password: encrypt_password.(params[:password]))
        end
      end
    end
  end
end
