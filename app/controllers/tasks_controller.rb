class TasksController < ApplicationController
  before_action :set_task_list

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def create
    @task = @task_list.tasks.create(task_params)
    redirect_to user_task_list_url(@user, @task_list)
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to user_tasks_url
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @task = @task_list.tasks.find(params[:id])
    if @task.destroy
    end
    redirect_to user_task_list_url(@user, @task_list)
  end

  def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, Time.now)
    redirect_to user_tasks_url
  end

  private

  def set_task_list
    @user = User.find(params[:user_id])
    @task_list = TaskList.find(params[:task_list_id])
  end

  def task_params
    params.require(:task).permit(:content)
  end

end
