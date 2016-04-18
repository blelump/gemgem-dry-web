require 'web_helper'

RSpec.describe '/users', type: :request do
  it 'creates a user' do
    post '/users', user: { name: 'Jane', email: 'jane@doe.org', password: 'foo' }

    expect(last_response).to be_created
    expect(MultiJson.load(last_response.body).keys).to eq(%w(name email id))
  end
end
