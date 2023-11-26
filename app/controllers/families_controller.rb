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
    
    begin
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # ユーザーが見つからない場合の処理
      user_not_found
    end
  end

  private

  def user_not_found
    flash[:alert] = "指定されたユーザーは存在しません。新規ユーザーを登録してください。"
    redirect_to new_user_registration_path
  end

end
