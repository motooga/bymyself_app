class HomeController < ApplicationController

  def index
    if family_signed_in?
      @family = current_family
      @users = current_family.users
    elsif user_signed_in?
      @user = current_user
      @family = current_user.family
    end
  end

  def show
    authenticate_family!
    @family = Family.find(params[:id])
    @users = current_family.users
    @user = User.find(params[:id])
  end

end