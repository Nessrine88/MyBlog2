class PostsController < ApplicationController
  include PostsHelper

  def index
    @posts = Post.order(:created_at).page params[:page]
    @user = User.includes(posts: :comments).find(params[:user_id])
    @comments = Comment.where(post_id: @posts.pluck(:id))
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created'
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
