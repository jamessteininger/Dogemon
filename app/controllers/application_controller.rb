class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:css_theme, :coin_made, :guild_id, :attack, :health, :total_health, :magic, :bio, :imageurl, :dogetag, :email, :password, :password_confirmation, :current_password, :coin, :if_accepted_terms, :b_mod)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:css_theme, :coin_made, :guild_id, :bio, :imageurl, :coin, :dogetag,  :email, :password, :password_confirmation, :current_password, :if_accepted_terms, :b_mod)
    end
  end
end
