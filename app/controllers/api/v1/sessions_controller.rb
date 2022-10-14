class Api::V1::SessionsController < Api::V1::BaseController
  before_action :validate_params, only: [:create]
  before_action :authorize_request, except: :create

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user&.valid_password?(params[:user][:password])
      time = Time.now + 1.minutes
      token = JsonWebToken.encode({user_id: @user.id, exp: time})
      json_response({ id: @user.id, token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.name })
    else
      unauthorized
    end
  end

  def destroy
    JsonWebToken.encode({exp: Time.now})
  end

  protected

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def validate_params
    return if params[:user].present?

    json_response({error: 'Failed, missing parameters'})
  end
end
