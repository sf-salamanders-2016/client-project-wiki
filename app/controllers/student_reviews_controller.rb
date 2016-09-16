class StudentReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @student_review = StudentReview.new(appointment_id: @appointment_id)
  end

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @student_review = StudentReview.find(params[:id])
  end
end
