require 'simple/import'

module Entities
  class User < Dry::Types::Struct
    class Create < Trailblazer::Operation
      include Trailblazer::Operation::Model
      include Trailblazer::Operation::Representer
      include Trailblazer::Operation::Representer::Deserializer::Hash
      include Simple::Functions
      ##
      # TODO: Would love to be able to do this, but Dry::AutoInject breaks operations by doing some fancy overriding of ::new
      ##
      # include Simple::Import(
      #   'user.encrypt_password',
      #   'persistence.persist_user'
      # )

      model Entities::User, :create

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
          f.encrypted_password = encrypt_password.(params[:password])
          @model               = self.class.model_class.new(persist_user.(t(:symbolize_keys)[f.to_nested_hash]))
        end
      end

      def to_json(*)
        super(exclude: [:password, :encrypted_password])
      end

      private

      def model!(params)
        OpenStruct.new
      end

      def encrypt_password
        Simple::Application.config.container.resolve('user.encrypt_password')
      end

      def persist_user
        Simple::Application.config.container.resolve('persistence.persist_user')
      end

    end
  end
end
