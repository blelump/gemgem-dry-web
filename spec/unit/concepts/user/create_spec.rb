require 'web_helper'
require 'concepts/user/operations/create'

RSpec.describe Entities::User::Create do
  subject(:create_user) { Entities::User::Create }

  # TODO: Because we can't use Dry::AutoInject, we can't inject our dependencies in the test :(
  # let(:encrypt_password) { instance_double(Entities::User::EncryptPassword) }

  it 'creates a user with encrypted password' do
    # expect(encrypt_password).to receive(:call).with('foo').and_return('foo-encrypted')

    input = { 'name' => 'Jane', 'email' => 'jane@doe.org', 'password' => 'foo' }

    op   = create_user.(input)
    user = op.model

    expect(user.name).to eql(input['name'])
    expect(user.email).to eql(input['email'])
    # expect(user.encrypted_password).to eql('foo-encrypted')
  end

  it 'raises error when params are not valid' do
    res, op = create_user.run(name: '')

    expect(res).to be_falsey
    expect(op.errors).not_to be_empty
  end
end
