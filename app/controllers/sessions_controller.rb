class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by :email => params[:email]

    if @user.nil?
      p 'if'
      flash[:error] = "Email does not exist, try again."
      redirect_to users_path
    elsif @user.password == params[:password]
      p 'elsif'
      session[:current_user_id] = @user.id
      redirect_to user_url(@user), :success => "You are logged in. Welcome!"
      flash[:notice] = "You are logged in. Welcome!"
    else
      p 'else'
      flash[:error] = "Password is incorrect, try again."
      redirect_to users_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_user_path , :success => "You are logged out. See you later!"
    flash[:notice] = "You are logged out. See you later!"
  end
end
