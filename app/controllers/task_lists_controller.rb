class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy, :complete]

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
      redirect_to user_task_list_path(@user, @task_list), notice: 'Tasklist successfully created.'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def edit
    @user = User.find(params[:user_id])
    @task_list = @user.task_lists.find(params[:id])
  end

  def update
    if @task_list.update(task_list_params)
      redirect_to user_task_list_url, notice: 'Tasklist successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @task_list.destroy
    redirect_to user_task_lists_path, notice: 'Tasklist successfully deleted.'
  end

  private

  def set_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end

end
