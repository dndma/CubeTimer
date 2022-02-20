require 'rails_helper'

RSpec.describe MySolve, type: :model do
  after(:all) { User.delete_all }
  it 'should vaildate normal user' do
    User.create(email: 'some@tes', encrypted_password: '098765')
  end

  it 'should not validate user' do
    user = User.create(email: 123, encrypted_password: '098765')
    expect(user).not_to be_valid
  end
end


