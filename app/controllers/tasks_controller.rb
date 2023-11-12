class TasksController < ApplicationController
  before_action :authenticate_family!, except: [:update]
  # before_action :authenticate_access,only: [:update]

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
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def update
    @task =Task.find(params[:id])
    new_status = params.dig(:task, :status_id)
    respond_to do |format|
    if @task.update(status_id: new_status)
        format.json{render json: { status: 'success'}}
        format.js 
    else
        format.json {render json: {status: 'error'}}
      end
    end
  end
 private


 def set_user
  @user = @family.users.find(params[:user_id])
 end
 
 def task_params
  params.require(:task).permit(:taskname, :category_id, :point, :schedule_id, :status_id).merge(family_id: @family.id, user_id: @user.id)
 end

end
