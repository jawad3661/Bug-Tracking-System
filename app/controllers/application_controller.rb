class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    if current_user.user_type == "Admin"
       admin_users_path
    else
      root_path
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :pasword,:name, :user_type])
  end
end
