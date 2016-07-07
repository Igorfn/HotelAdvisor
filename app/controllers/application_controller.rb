class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
                                                            :password_confirmation, :remember_me, :image, :image_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
                                                                   :password_confirmation,
                                                                   :current_password, :image, :image_cache) }
  end

  def after_sign_in_path_for(resource)
    current_user
  end
end
