class TaskCommentsController < ApplicationController
  before_action :set_task

  def create
    set_project
    @task = Task.find(params[:task_id])
    @task_comment = @task.task_comments.build(task_comment_params)
    @task_comment.user = current_user
  
    if @task_comment.save
      redirect_to project_task_path(@project, @task), notice: 'Comment was successfully created.'
    else
      redirect_to project_task_path(@project, @task), alert: 'Comment could not be created.'
    end
  end

  def destroy
    set_project
    @task_comment = @task.task_comments.find(params[:id])
    @task_comment.destroy
    redirect_to project_task_path(@project, @task), notice: 'Comment was successfully deleted.'
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_comment_params
    params.require(:task_comment).permit(:content)
  end
end
