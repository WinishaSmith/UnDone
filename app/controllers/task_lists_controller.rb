class TaskListsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @task_lists = @user.task_lists
  end

  def new
    @user = User.find(params[:user_id])
    @task_list = TaskList.new
  end

  def create
    @user = User.find(params[:user_id])
    @task_list = @user.task_lists.create!(task_list_params)

    if @task_list.save
      redirect_to user_task_lists_path(@user)
    else
      render 'new'
    end
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @task_list = @user.task_lists.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])

    if @task_list.update(task_list_params)
      redirect_to user_task_lists_url
    else
      render 'edit'
    end
  end

  private

  def find_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end

end
