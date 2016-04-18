require 'concepts/user/operations/encrypt_password'

RSpec.describe Entities::User::EncryptPassword do
  subject(:encrypt_password) { Entities::User::EncryptPassword.new }

  describe '#call' do
    it 'returns an encrypted string' do
      hash = encrypt_password.('foo')

      expect(hash).to_not eql('foo')
      expect(hash.size).to be(60)
    end
  end

  describe '#same?' do
    it 'returns true when hash matches password' do
      hash = encrypt_password.('foo').to_s

      expect(encrypt_password.same?(hash, 'foo')).to be(true)
    end

    it 'returns false when hash does not match password' do
      hash = encrypt_password.('bar').to_s

      expect(encrypt_password.same?(hash, 'foo')).to be(false)
    end
  end
end
