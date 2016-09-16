class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by :username => params[:username]

    if @user.nil?
      flash[:error] = "Username does not exist, try again."
      redirect_to users_path
    elsif @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_url, :success => "You are logged in. Welcome!"
    else
      flash[:error] = "Password is incorrect, try again."
      redirect_to users_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to users_path, :success => "You are logged out. See you later!"
  end
end
