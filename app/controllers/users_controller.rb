class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
    # user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = user.id
      redirect_to '/', notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  def user_params
    params.require(:user).permit(:user_throw)
  end
end
