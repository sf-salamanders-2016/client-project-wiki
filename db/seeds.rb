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
student = Student.create(user: john)
mentor = Mentor.create(user: jane)
appointment = Appointment.create(student: student, mentor: mentor, start_time: Time.now, duration: 30)
ruby = Topic.create(name: "Ruby")
mentor.topics << ruby
StudentReview.create(appointment: appointment, mentor_rating_of_student: 5, mentor_review_of_student: "Great")
mentor_review = MentorReview.create(appointment: appointment, student_rating_of_mentor: 4, student_review_of_mentor: "Excellent")





