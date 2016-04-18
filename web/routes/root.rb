require 'trailblazer/operation/controller'

class Simple::Application < Dry::Web::Application
  include Trailblazer::Operation::Controller
  plugin :heartbeat
  plugin :halt
  plugin :json, :classes => [Array, Hash, ::Trailblazer::Operation]

  route do |r|
    r.on('users') do
      r.post do
        r.resolve('user.create') do |create_user|
          run create_user, params: r[:user] do |op|
            response.status = 201
            r.block_result(op)
            r.halt(response.finish)
          end

          r.halt(400, @operation.errors)
        end
      end
    end
  end

end
