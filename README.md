# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby 2.5.0p0

* Rails 5.1.6

* System dependencies

* Configuration

* Postgresql

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


# Gems

* gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
* gem 'autoprefixer-rails'
* gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
* gem "font-awesome-rails"
* gem 'pry'


# Superate Y Triunfa

## Student
* Name
* LastName
* Email
* Password
* Course => belongs to course
* Credits => has many through courses
* Groupe => belongs to groupe


## Admin
* Name
* Email
* Password


## Teacher
* Name
* Email
* Password
* Courses => has many courses
* Groupes => has many groupes


## Course
* Name
* Start Date
* Finish Date
* Credits => has many credits
* Groupes => has many groupes
* Students => has many students
* Teacher => has many teachers

## Credits
* Activity
* Points
