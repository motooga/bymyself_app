class TasksController < ApplicationController
  before_action :authenticate_family!

  def new
    @task = Task.new
    @family = current_family
    set_user

  end

  def create
    @family = current_family
    set_user
    Task.create(task_params)
  end

 private


 def set_user
  @user = @family.users.find(params[:user_id])
end
 def task_params
  params.require(:task).permit(:taskname, :category_id, :point, :schedule_id).merge(family_id: @family.id, user_id: @user.id)
 end
end
