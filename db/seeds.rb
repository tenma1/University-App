# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin_user = AdminUser.find_or_initialize_by(email: 'admin@example.com') if Rails.env.development?
admin_user.password = 'password'
admin_user.password_confirmation = "password"
admin_user.save

# user = User.find_or_initialize_by(email: 'user1@gmail.com') if Rails.env.development?
# user.password = '123456'
# user.password_confirmation = "123456"
# user.save

Feature.find_or_create_by!(name: 'Hostel')
Feature.find_or_create_by!(name: 'PlayGround')
Feature.find_or_create_by!(name: 'Mess')
Feature.find_or_create_by!(name: 'Library')

Role.find_or_create_by!(name: 'Principal')
Role.find_or_create_by!(name: 'Teacher')
Role.find_or_create_by!(name: 'Warden')
Role.find_or_create_by!(name: 'Peon')
Role.find_or_create_by!(name: 'Student')
Role.find_or_create_by!(name: 'Visitor')

Facility.find_or_create_by!(name: 'Gym')
Facility.find_or_create_by!(name: 'Study_Area')
Facility.find_or_create_by!(name: 'Pool')
Facility.find_or_create_by!(name: 'Wi-Fi')
Facility.find_or_create_by!(name: 'Cafeteria')