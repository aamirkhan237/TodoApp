# README

 # For Running Project at your system
  * git clone https://github.com/aamirkhan237/TodoApp.git
  * cd TodosApp
 
    ### Setup Database Migration
      * Update the database.yml according to your database configuration
      * goto TodosApp/config/database.yml
      * rails db:create
      * rails db:migrate
      * rails s

**Ruby version**
  ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-darwin21]
**Rails version**
  Rails 7.1.3.4

* System dependencies
  Ensure all required system dependencies are installed, including Ruby, Rails, and PostgreSQL (optional) .
* Configuration
> There is no specific configuration required for running these project,
  however gem such as pagy,devise,devise-jwt,spec etc have their configuration in application file
  or helper file
  
  ### How to run the test suite
  * To run all test : cd TodosApp > rspec
  * To run all **Model** test: rspec  spec/models
  * To run Specific Model test: rspec spec/models/[your_file]
  * To run all **Controller** test: rspec  spec/requests
  * To run Specific Controller test: rspec spec/requests/[your_file]
  * Services (job queues, cache servers, search engines, etc.)

## API (Go to postman for testing api) the server must be running
  ### User
    *  POST     http://localhost:3000/users/             SIGN_UP

    {  "user": {
            "email": "new@example.com",
            "password":"password",
            "first_name": "john",
            "last_name": "doe",
            "mobile_number": "9876543210",
            "date_of_birth": "2024-06-13"
        }
    }
    *  POST    http://localhost:3000/users/sign_in         SIGN_IN
     {
       "user":{
           "email":"aman@example.com",
           "password":"annann"
      }
    }
    *  GET      http://localhost:3000/api/v1/users/1       CURRENT_USER
    *  DELETE   http://localhost:3000/users/sign_out       SIGN_OUT  
    *  POST     http://localhost:3000/api/v1/tasks         TASKS (CREATE)
        { "task":{
                  "title":"Task 7",
                  "description":"description for task 7",
                  "status":1
                }
           }
    *  GET     http://localhost:3000/api/v1/tasks         TASKS (READ)
    *  GET     http://localhost:3000/api/v1/tasks/5       TASKS/:ID (READ)
    *  PATCH   http://localhost:3000/api/v1/tasks/63      TASKS/:ID (UPDATE)
        {
         "title": "task 5",
         "description": "Description for task 5",
         "status": 1
        }
    *  DELETE  http://localhost:3000/api/v1/tasks/66     TASKS/:ID (DELETE)
    *  PATCH   http://localhost:3000/api/v1/tasks/64/update_status   TASKS/:ID/UPDATE_STATUS (UPDATE)
          {
           "status": 0
         }
        
     


* Deployment instructions

* ...
