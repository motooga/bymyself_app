class FamiliesController < ApplicationController

  def index
    authenticate_family!
    @family = current_family
    @users = current_family.users
  end

  def show
    authenticate_family!
    @family = Family.find(params[:id])
    @users = current_family.users
    @user = User.find(params[:id])
  end
end
