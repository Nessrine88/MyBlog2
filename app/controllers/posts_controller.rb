class PostsController < ApplicationController
  include PostsHelper
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

  def new
    @post = @current_user.posts.new
  end

  def create
    @post = @current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@current_user), notice: 'Post was successfully created'
    else

      flash.now[:alert] = 'Error: Post could not be created'
      render :new
    end
  end




  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
