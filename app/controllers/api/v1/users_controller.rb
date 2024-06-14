class Api::V1::UsersController < ApiController
    before_action :authenticate_user!
    def show  # Profile retrieval endpoint (requires authentication)
        @user = current_user # Assuming you have a `current_user` method based on token
        render json: @user
      end
    def index
        @users =User.all
        render json: @users
    end
end