# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # include Accessible
  #  skip_before_action :check_user, only: :destroy
   before_action :configure_sign_in_params, if: :devise_controller?

  # GET /resource/sign_in
  # def new
  #   super
  # end

#    POST /resource/sign_in
    def create
      super do |resource|
        family_id = resource.family_id
        session[:family_id] = family_id
      end
    end



  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :password, :remember_me])
   end

   def after_sign_in_path_for(resource)
    if resource.family.present? && resource.id.present?
      family_user_path(family_id: resource.family.id, id: resource.id)
    else
      root_pat
    end
   end
end
