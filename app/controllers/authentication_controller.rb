# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    email = auth_params[:email]
    password = auth_params[:password]

    auth_token = AuthenticateUser.new(email, password).call
    # @TODO: Anthony get user and return sanitized user on login
    # user = User.where(email: email)
    # sanitizedUser = user.get_sanitized_user
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
