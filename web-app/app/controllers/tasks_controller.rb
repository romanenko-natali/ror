class TasksController < ApplicationController
    before_action :set_project
    before_action :set_task, only: %i[show edit update destroy]

    def index
      @tasks = @project.tasks
    end

    def show
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        @project.tasks << @task  # This creates the association in the join table
        redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @task.update(task_params)
        redirect_to project_tasks_path(@project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully deleted.'
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end
  end
