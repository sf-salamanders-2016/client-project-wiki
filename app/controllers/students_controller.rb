class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_appointments, only: [:show]
  before_action :set_complete, only: [:show]

  include AppointmentsHelper

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = 'Student created'
      redirect_to @student
    else
      flash[:alert] = 'Student not created'
      render :new
    end
  end

  def update
  if @student.update_attributes(student_params)
    flash[:notice] = 'Student updated'
    redirect_to @student
  else
    flash[:alert] = 'Student not updated'
    render :edit
  end
end

def destroy
  @student.destroy
  flash[:notice] = 'Student deleted'
  redirect_to @student
end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def set_appointments
    @appointments = Appointment.where(student: nil)
  end

  def set_complete
    @complete = complete_appointments(@student)
  end

end
