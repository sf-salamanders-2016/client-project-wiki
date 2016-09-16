class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find(params[:id])

    if params[:mentor] == 1
      @mentor = Mentor.where(user_id: @user.id)
    elsif
      @student = Student.where(user_id: @user.id)
    end

    if current_user
      @user = current_user
    else
      redirect_to 'users#new'
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user.id)
      if params[:mentor] == '1'
        @mentor = Mentor.new(user_id: @user.id)
        p "*" * 50
        p @mentor.save
      else
        @student = Student.new(user_id: @user.id)
        p "*" * 50
        p @student.save
      end
      flash[:notice] = "Thanks for registering!"
      params
    else
      flash[:notice] = "User did not save."
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_users_url
    flash[:notice] = "You have successfully deleted your account."
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :pronouns, :current_phase, :password, :mentor)
  end
end
