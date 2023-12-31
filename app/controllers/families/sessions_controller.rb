# frozen_string_literal: true

class Families::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_user, only: :destroy
   before_action :configure_sign_in_params, only: [:create]
  #  before_action :sign_in_params, if: :devise_controller?

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))

  end

  # POST /resource/sign_in
  #  def create
    # super
  #  end

  # DELETE /resource/sign_out
   def destroy
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # private
    def configure_sign_in_params

      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
    
    def check_user
      if family_signed_in?
        flash.clear
        redirect_to root_path
      end
    end

    # def sign_in_params
    #  params.require(:family).permit(:email, :password, :remember_me)
    # end

end
