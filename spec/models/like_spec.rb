require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'can create a new like' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    post = user.posts.create(message: "Hello test!")
    like = post.likes.build
    like.user = user
    like.save
    expect(like).to be_valid
  end

  it 'will not create a like without a user' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    post = user.posts.create(message: "Hello test!")
    like = post.likes.create
    expect(like).not_to be_valid
  end

  it 'will not create a like without a post' do
    like = Like.create
    expect(like).not_to be_valid
  end
end
