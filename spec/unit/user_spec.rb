require 'entities/user'

RSpec.describe Entities::User do
  subject(:user) { Entities::User.new(id: 1, name: 'Jane', email: 'jane@example.com', encrypted_password: 'asdf1234') }

  describe '#id' do
    it 'works' do
      expect(user.id).to be(1)
    end
  end

  describe '#name' do
    it 'works too' do
      expect(user.name).to eql('Jane')
    end
  end
end
