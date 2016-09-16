class AppointmentsController < ApplicationController

  # Include ApplicationHelper with current_user method
  include ApplicationHelper

  def show
    @appointment = Appointment.find(params[:id])
  end

  # May be more than one way to update an appointment.
  # Do we need to create custom routes?
  def update
    @appointment = Appointment.find(params[:id])
    p params[:appointment]
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
    params.require(:appointment).permit(:student_id)
  end

end
