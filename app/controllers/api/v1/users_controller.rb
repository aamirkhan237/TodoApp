class Api::V1::UsersController < ApiController
    before_action :authenticate_user!
  
    # GET /api/v1/users/:id
    def show
      @user = current_user
      render json: @user
    end
  
    # GET /api/v1/users
    def index
      @users = User.all
      render json: @users
    end
  end
  