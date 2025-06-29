class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image, :user_name, :profile])
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

end