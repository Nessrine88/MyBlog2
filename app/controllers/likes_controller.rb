# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    like = Like.new(user: @user, post: @post)
    if @post.likes.find_by(user_id: @user)
      flash[:notice] = 'You already liked this post'
    elsif like.save
      flash[:success] = 'You liked this post'
    end
    redirect_to user_post_path(@user, @post)
  end
end
