class Api::V1::RegistrationsController < Api::V1::BaseController
  before_action :validate_params

  def create
    @user = User.new(user_params)

    if @user.save
      ok_response
    else
      json_response(@user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def validate_params
    return if params[:user].present?

    json_response({error: 'Failed, missing parameters'})
  end
end
