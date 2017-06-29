class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create
    redirect_to posts_path
  end

  def new
    @like = Like.new
  end
end
