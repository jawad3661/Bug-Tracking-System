class Api::V1::Admin::UsersController < Api::V1::BaseController
  before_action :authorize_request
  before_action :set_user, except: :index
  before_action :validate_user

  def index
    @users = User.not_admin
    json_response(@users)
  end

  def show
    json_response(@user)
  end

  def destroy
    @user.destroy

    json_response('successful, User informations successfully deleted')
  end

  def update
    @user.update(user_params)

    json_response(@user)
  end

  def update_status
    @user.update(deactivated: !@user.deactivated)

    json_response("Account #{@user.deactivated? ? 'Disabled' : 'Enabled'}")
  end

  private

  def user_params
   params.require(:user).permit(:email, :name, :user_type)
  end

  def set_user
    @user = User.find_by(id: params[:id])

    json_response({error: 'User not found'}) if @user.blank?
  end

  def validate_user
    return if current_user&.admin?

    unauthorized
  end
end
