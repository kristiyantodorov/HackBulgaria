class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to users_path
  end

  def authenticate
    @user = User.find_by(username: user_params[:username])
    password = user_params[:password]
    if @user.authenticate(password)
      redirect_to user_path(@user), notice: "You have successfully logged in!"
    else
      redirect_to users_path, notice: "You have failed to log in!"
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :username, :password, :password_confirmation)
  end
end
