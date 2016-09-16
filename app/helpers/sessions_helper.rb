module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_mentor
    @mentor ||= Mentor.find(session[:user_id]) if session[:user_id]
  end

  # mentor? returns true if user logged in as mentor,
  # false if logged in as student
  def mentor?
    # Need to set session[:role] to "mentor" or "student"
    # when user logs in
    p session[:user_id] == Mentor.where(user_id: @user.id)
  end
end
