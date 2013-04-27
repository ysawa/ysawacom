require 'spec_helper'

describe User do
  it 'can be initialized' do
    user = User.new
    user.should_not be_persisted
  end

  describe 'Fabricate(:user)' do
    it 'works successfully' do
      user = Fabricate(:user)
      user.should be_valid
      user.should be_persisted
      user.should be_confirmed
    end
  end
end
