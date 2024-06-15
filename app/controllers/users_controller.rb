class UsersController < ApplicationController
    before_action :authenticate_user!    

    #users profile users/:id
    def show
      @user = User.find(params[:id])
    end
end
