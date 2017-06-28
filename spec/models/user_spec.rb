require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can create a new user' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    expect(user).to be_valid
  end

  it 'will not create an invalid user' do
    user = User.create(username: '', password: '123456', email: 'jade@jade.com')
    expect(user).not_to be_valid
    user = User.create(username: 'Jade', password: '123456', email: '')
    expect(user).not_to be_valid
  end

  it 'should not create a user if username/email are not unique' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    user = User.create(username: 'Kye', password: '123456', email: 'jade@jade.com')
    expect(user).not_to be_valid
    user = User.create(username: 'Jade', password: '123456', email: 'kye@jade.com')
    expect(user).not_to be_valid
  end
end
