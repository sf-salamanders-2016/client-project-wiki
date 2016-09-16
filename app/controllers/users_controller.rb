class UsersController < ApplicationController
  include SessionsHelper

  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # if current_user
    #   @user = current_user
    # else
    #   redirect_to 'users#new'
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user)
      flash[:notice] = "Thanks for registering!"
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
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :pronouns, :current_phase, :password)
  end
end
