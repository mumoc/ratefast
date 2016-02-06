require 'rails_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }
  auth_hash = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: '1111',
    info: { name: 'dummy', email: 'dummy@magmalabs.io' }
  })

  describe 'from_omniauth' do
    it "Log in with github and omniauth" do
      expect(User.from_omniauth(auth_hash)).to eq(User.last)
    end
  end
end
