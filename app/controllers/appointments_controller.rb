class AppointmentsController < ApplicationController

  def show
    @appointment = Appointment.find(params[:id])
  end

  # May be more than one way to update an appointment.
  # Do we need to create custom routes?
  def update
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
  end

end
