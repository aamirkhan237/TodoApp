# README

* For Running Project at your system
  git clone https://github.com/aamirkhan237/TodoApp.git
  cd TodosApp
## Setup Database Migration
  Update the database.yml according to your database configuration 
  goto TodosApp/config/database.yml
  rails db:create
  rails db:migrate

* Ruby version
  ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-darwin21]
* Rails version
  Rails 7.1.3.4

* System dependencies
  Ensure all required system dependencies are installed, including Ruby, Rails, and PostgreSQL (optional) .
* Configuration
  There is no specific configuration required for running these project,
  however gem such as pagy,devise,devise-jwt,spec etc have their configuration in application file
  or helper file
  
  ### How to run the test suite
  * To run all test : cd TodosApp > rspec
  * To run all **Model** test: rspec rspec spec/models
  * To run Specific Model test: rspec spec/models/[your_file]
  * To run all **Controller** test: rspec rspec spec/requests
  * To run Specific Controller test: rspec spec/requests/[your_file]
  * Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
