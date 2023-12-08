# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # include Accessible
    before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    # prepend_before_action :require_no_authentication, only: [:cancel]
    # before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_family!, if: :devise_controller?
    # before_action :creatable?, only: [:new, :create]


  def new
    authenticate_family!
    @user = User.new
  end

  def create
    authenticate_family!
    super do |user|
       if family_signed_in?
          user.family = current_family
          user.save! 
       end

    end
  end

  def after_sign_up_path_for(resource)
    root_path
  end
 
private
   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password, :password_confirmation, :family_id, :user_points])
   end

  def sign_up(resource_name, resource)
    if !current_family
       sign_in(resource_name, resource)
    end
  end

  end
