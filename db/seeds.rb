# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Student.destroy_all
Mentor.destroy_all
Appointment.destroy_all
StudentReview.destroy_all
MentorReview.destroy_all
Topic.destroy_all


john = User.create(first_name: "John", last_name: "Doe", email: "john@john.com", password: "johnjohn")
jane = User.create(first_name: "Jane", last_name: "Roe", email: "jane@jane.com", password: "janejane")
bon = User.create(first_name: "Bon", last_name: "Boe", email: "bane@jane.com", password: "janejane")
joone = User.create(first_name: "Joone", last_name: "Raoe", email: "jane@bane.com", password: "janejane")
jene = User.create(first_name: "Jene", last_name: "Robe", email: "ane@ane.com", password: "janejane")
jone = User.create(first_name: "Jone", last_name: "Roeb", email: "rane@rane.com", password: "janejane")
student = Student.create(user: john)
student1 = Student.create(user: bon)
student2 = Student.create(user: joone)
mentor = Mentor.create(user: jane)
mentor1 = Mentor.create(user: jene)
mentor2 = Mentor.create(user: jone)
appointment = Appointment.create(student: student, mentor: mentor, start_time: Time.now, duration: 30)
appointment = Appointment.create(student: student1, mentor: mentor1, start_time: Time.now, duration: 30)
appointment = Appointment.create(student: student2, mentor: mentor2, start_time: Time.now, duration: 30)
ruby = Topic.create(name: "Ruby")
java = Topic.create(name: "Java")
css = Topic.create(name: "CSS")
mentor.topics << ruby
mentor1.topics << java
mentor2.topics << css
StudentReview.create(appointment: appointment, mentor_rating_of_student: 5, mentor_review_of_student: "Great")
mentor_review = MentorReview.create(appointment: appointment, student_rating_of_mentor: 4, student_review_of_mentor: "Excellent")


# Create more appointments for testing purposes
10.times { Appointment.create(student: student, mentor: mentor, start_time: Time.now, duration: 30) }




