class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.create(task_params)

    if @task.save
      redirect_to user_tasks_path(@user)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to user_task_url
    else
      render 'edit'
    end
  end

  def destroy
    if @task.destroy
      redirect_to user_tasks_url
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, Time.now)
    flash[:notice] = "Task marked as complete"
    redirect_to user_tasks_url
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end

end
