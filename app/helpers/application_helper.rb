module ApplicationHelper

  # mentor? returns true if user logged in as mentor,
  # false if logged in as student
  def mentor?
    # Need to set session[:role] to "mentor" or "student"
    # when user logs in
    session[:role] == "mentor"
  end
end
