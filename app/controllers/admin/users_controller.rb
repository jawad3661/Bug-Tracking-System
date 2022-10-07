class Admin::UsersController < ApplicationController
  before_action :set_user, except: :index
  before_action :set_authorize, except: :index

  def index
    @users = User.not_admin
    authorize [:admin, @users]
  end

  def show; end

  def update_status
    @user.update(deactivated: !@user.deactivated)

    redirect_to admin_users_path, notice: "Account #{@user.deactivated? ? 'Disabled' : 'Enabled'}"
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Project was successfully destroyed'
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :user_type)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_authorize
    authorize [:admin, @user]
  end
end
