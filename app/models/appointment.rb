class Appointment < ApplicationRecord
  has_one :student_review
  has_one :mentor_review
  # Need to be able to create appointment without student
  belongs_to :student, required: false
  belongs_to :mentor

  # helpers
  def mentor_name
    mentor.user.full_name if mentor
  end

  def student_name
    if student
      student.user.full_name
    end
  end

  def date
    start_time.strftime("%B %e, %Y")
  end

  def starts_at
    start_time.strftime("%l:%M %p")
  end

  def end_time
    start_time + duration * 60
  end

  def ends_at
    end_time.strftime("%l:%M %p")
  end

  def complete?
    Time.now > end_time
  end

  def current_student?
    student && current_user == student
  end

  def current_mentor?
    current_user == mentor
  end

end
