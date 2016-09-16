class StudentReviewsController < ApplicationController
  def new

  end

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @student_review = StudentReview.find(params[:id])
  end
end
