module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # mentor? returns true if user logged in as mentor,
  # false if logged in as student
  def mentor?
    # Need to set session[:role] to "mentor" or "student"
    # when user logs in
    session[:role] == "mentor"
  end
end
