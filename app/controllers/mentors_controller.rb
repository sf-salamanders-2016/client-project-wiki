class MentorsController < ApplicationController
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]

  def create
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      flash[:notice] = 'Mentor created'
      redirect_to @mentor
    else
      flash[:alert] = 'Mentor not created'
      render :new
    end
  end

  def update
  if @mentor.update_attributes(mentor_params)
    flash[:notice] = 'Mentor updated'
    redirect_to @mentor
  else
    flash[:alert] = 'Mentor not updated'
    render :edit
  end
end

def destroy
  @mentor.destroy
  flash[:notice] = 'Mentor deleted'
  redirect_to @mentor
end

  private

  def set_mentor
      @mentor = Mentor.find(params[:id])
  end

end
