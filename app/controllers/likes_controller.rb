# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = Like.new(user: @current_user, post: @post)
    if @post.likes.find_by(user_id: @current_user.id)
      flash[:notice] = 'You already liked this post'
    elsif like.save
      flash[:success] = 'You liked this post'
    end
    redirect_to user_post_path(@current_user, @post)
  end
end
