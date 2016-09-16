module ApplicationHelper

  # Move these methods to SessionsHelper once we have one
  def current_user
    ## Change this when user login is complete
    # User.find(session[:id])
    User.first
  end

  # mentor? returns true if user logged in as mentor,
  # false if logged in as student
  def mentor?
    # Need to set session[:role] to "mentor" or "student"
    # when user logs in
    session[:role] == "mentor"
  end
end
