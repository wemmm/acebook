require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'can create a new comment' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    post = user.posts.create(message: 'Hello test!')
    comment = post.comments.build(body: 'Hello to you too!')
    comment.user = user
    comment.save
    expect(comment).to be_valid
  end

  it 'cannot create a comment without it belonging to a post' do
    comment = Comment.create(body: 'I am doomed to fail')
    expect(comment).not_to be_valid
  end

  it 'cannot create a comment without it having a user id' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    post = user.posts.create(message: 'Hello test!')
    comment = post.comments.create(body: 'I am doomed to fail')
    expect(comment).not_to be_valid
  end
end
