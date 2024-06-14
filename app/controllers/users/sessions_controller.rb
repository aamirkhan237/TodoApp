# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json, :html
  skip_before_action :verify_authenticity_token
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # private
  # def respond_with(current_user, _opts = {})
  #   render json: {
  #     status: { 
  #       code: 200, message: 'Logged in successfully.',
  #       data: current_user
  #     }
  #   }, status: :ok
  # end
  # def respond_to_on_destroy
  #   if request.headers['Authorization'].present?
  #     jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').[1], Rails.application.credentials.fetch(:secret_key_base)).first
  #     current_user = User.find(jwt_payload['sub'])
  #   end
    
  #   if current_user
  #     render json: {
  #       status: 200,
  #       message: 'Logged out successfully.'
  #     }, status: :ok
  #   else
  #     render json: {
  #       status: 401,
  #       message: "Couldn't find an active session."
  #     }, status: :unauthorized
  #   end
  # end
  private
  def respond_with(resource, _options = {})
    respond_to do |format|
      format.html { super }
      format.json do
        render json: {
          status: { code: 200, message: 'Logged in successfully.' },
          data: resource
        }, status: :ok
      end
    end
  end

  def respond_to_on_destroy
    respond_to do |format|
      format.html { super }
      format.json do
        if request.headers['Authorization'].present?
          jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
          resource = User.find(jwt_payload['sub'])
        end

        if resource
          render json: {
            status: 200,
            message: 'Logged out successfully.'
          }, status: :ok
        else
          render json: {
            status: 401,
            message: "Couldn't find an active session."
          }, status: :unauthorized
        end
      end
    end
  end
end

