class ProjectCommentsController < ApplicationController
    before_action :set_project

    def create
      @project_comment = @project.project_comments.build(project_comment_params)
      @project_comment.user = current_user
      if @project_comment.save
        redirect_to project_path(@project), notice: 'Comment was successfully created.'
      else
        redirect_to project_path(@project), alert: 'Comment could not be created.'
      end
    end
  
    def destroy
      @project_comment = @project.project_comments.find(params[:id])
      @project_comment.destroy
      redirect_to project_path(@project), notice: 'Comment was successfully deleted.'
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  
    def project_comment_params
      params.require(:project_comment).permit(:content)
    end
end
