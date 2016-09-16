module AppointmentsHelper

  def complete_appointments(person)
    person.appointments.select { |appt| appt.complete? }
  end

  def available_appointments(person)
    person.appointments.select { |appt| !appt.student }
  end

end
