class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to new_user_session_path, notice: 'Signed out successfully.'
    else
      @user = User.find(params[:id])
      @posts = @user.posts
    end
  end
end
