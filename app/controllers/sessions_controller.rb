class SessionsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to user_url
  end

  def create
    @user = User.find_by :email => params[:email]
    if @user.nil?
      redirect_to new_user_path
      flash[:error] = "Email does not exist, try again."
    elsif @user.password == params[:password]
      session[:current_user_id] = @user.id
      flash[:notice] = "You are logged in. Welcome!"
    else
      redirect_to new_user_path
      flash[:error] = "Password is incorrect, try again."
    end
  end

  def update
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    @user = nil
    session.clear
    session.delete(:current_user_id)
    redirect_to new_user_path
    flash[:notice] = "You are logged out. See you later!"
  end

end
