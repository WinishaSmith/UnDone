class TaskListsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @task_lists = @user.task_lists
  end

  def create
    @user = User.find(params[:user_id])
    @task_list = TaskList.new
  end

end
