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

  # ユーザーを登録するアクション
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
  
  # #  GET /resource/sign_up
  #      def new
  #        super
  #      end


  #  #  POST /user
      # def create
  #     super do |user|
  #       user.family_id = current_family.id if current_family
  #     end
  #    end

      private

      # def configure_permitted_parameters
      #  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password, :password_confirmation, :family_id])
      # end

  #  GET /resource/edit
  #  def edit
  #    super
  #    params.require(:user).permit(:nickname, :password, :password_confirmation, :family_id)
  #  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password, :password_confirmation, :family_id])
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

 

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  def sign_up(resource_name, resource)
    if !current_family
       sign_in(resource_name, resource)
    end
  end

  

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
