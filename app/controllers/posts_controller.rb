class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = Comment.where(post_id: @posts.pluck(:id))
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @post = Post.find(params[:id])
  end
end
