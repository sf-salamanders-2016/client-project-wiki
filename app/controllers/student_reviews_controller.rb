class StudentReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @student_review = StudentReview.new(appointment_id: @appointment_id)
  end

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @student_review = StudentReview.find(params[:id])
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @student_review = StudentReview.new(student_review_params)
    @student_review.appointment = @appointment
    if @student_review.save
      redirect_to @appointment
    else
      render 'new'
    end
  end

  private
  def student_review_params
    params.require(:student_review).permit(:mentor_rating_of_student, :mentor_review_of_student)
  end
end
