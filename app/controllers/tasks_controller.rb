class TasksController < ApplicationController
  before_action :authenticate_family!, except: [:update]
  before_action :authenticate_access

  def new
    @task = Task.new
    @family = current_family
    set_user

  end

  def create
    @family = current_family
    set_user
    @task = Task.new(task_params)
    if @task.save
      redirect_to families_path
    else
      render :new
    end
  end

  def show
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def update
    binding.pry
    authenticate_access
  end
 private


 def set_user
  @user = @family.users.find(params[:user_id])
 end
 
 def task_params
  params.require(:task).permit(:taskname, :category_id, :point, :schedule_id, :status_id).merge(family_id: @family.id, user_id: @user.id)
 end

 def authenticate_access
  @task = Task.find(params[:id])
  if user_signed_in?
    if @task.status_id == 0
      if @task.update(status_id: 1)
        redirect_to family_user_path(family_id: params[:family_id],users_id: params[:users_id]) , notice: "お仕事完了報告をしました！！お疲れ様です。"
      else
        render family_user_path(family_id: params[:family_id],users_id: params[:users_id]) , notice: "報告失敗"
      end
    elsif family_signed_in?
      if @task.status_id == 1
        if @task.update(status_id: 2)
          redirect_to family_user_path(family_id: params[:family_id],users_id: params[:users_id]) , notice: "お仕事完了報告を承認してポイントを付与しました。"
        else
          render family_user_path(family_id: params[:family_id],users_id: params[:users_id]) , notice: "承認に失敗しました"
        end
      else
        redirect_to root_path, alert: "アクセス権がありません。"
      end
    end
  end 
 end
end
