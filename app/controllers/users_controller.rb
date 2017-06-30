class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    log_in(@user)
    redirect_to @user
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # current_user.avatar =
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end
end
