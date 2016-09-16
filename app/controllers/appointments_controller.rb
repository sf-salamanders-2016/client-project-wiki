class AppointmentsController < ApplicationController

  # Include ApplicationHelper with current_user method
  # Switch in SessionHelper once it's available
  include ApplicationHelper

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appoinment.save
      flash[:notice] = 'Appointment created'
      redirect_to @appointment.mentor
    else
      flash[:alert] = 'Appointment not created'
      render :new
    end
  end

  # May be more than one way to update an appointment.
  # Do we need to create custom routes?
  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      flash[:success] = "Appointment updated"
    end
    redirect_to @appointment
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:student_id, :start_time, :duration, :mentor_id)
  end

end
