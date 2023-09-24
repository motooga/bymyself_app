class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    added_attrs = [ :family_name, :email, :password, :nickname ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end



end
