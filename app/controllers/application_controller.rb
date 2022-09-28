class ApplicationController < ActionController::Base
  included RescueException
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_users_path
    elsif current_user.manager?
      manager_projects_path
    elsif current_user.developer?
      developer_projects_path
    elsif current_user.qa?
      qa_projects_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :pasword,:name, :user_type])
  end
end
