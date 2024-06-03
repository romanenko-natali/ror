class TasksController < ApplicationController
  before_action :set_project

  def index
    @tasks = @project.tasks
  end

  def show
    @task = @project.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      @project.tasks << @task
      redirect_to project_tasks_path(@project), notice: 'Task successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to project_tasks_path(@project), notice: 'Task successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @project.tasks.delete(@task)
    redirect_to project_tasks_path(@project), notice: 'Task successfully deleted.'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
