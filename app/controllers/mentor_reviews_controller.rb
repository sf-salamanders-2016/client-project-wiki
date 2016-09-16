class MentorReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @mentor_review = MentorReview.new(appointment_id: @appointment_id)
  end

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @mentor_review = MentorReview.find(params[:id])
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @mentor_review = MentorReview.new(mentor_review_params)
    @mentor_review.appointment = @appointment
    if @mentor_review.save
      redirect_to @appointment
    else
      render 'new'
    end
  end

  private
  def mentor_review_params
    params.require(:mentor_review).permit(:student_rating_of_mentor, :student_review_of_mentor)
  end
end
