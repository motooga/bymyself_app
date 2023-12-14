class TasksController < ApplicationController
  before_action :authenticate_family!, except: [:update ,:show]
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
      redirect_to family_user_path(@family, @user)
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
    if @task.update(status_id: new_status)

      if new_status.to_i == 2
        @user = @task.user
        @user.update(user_points: @user.user_points + @task.point )
      end
      respond_to do |format|
        format.json{render json: { status: 'success'}}
      end
    else
      render json: { status: 'success' }
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
