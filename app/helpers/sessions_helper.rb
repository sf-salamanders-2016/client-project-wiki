module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # mentor? returns true if user logged in as mentor,
  # false if logged in as student
  def mentor?
    return false if !current_user
    @mentor = Mentor.where(user_id: current_user.id)
    # Need to set session[:role] to "mentor" or "student"
    # when user logs in
    return true if @mentor.length > 0
    false
  end

  def student?
    return false if !current_user
    @student = Student.where(user_id: current_user.id)
    return true if @student.length > 0
    false
  end
end
