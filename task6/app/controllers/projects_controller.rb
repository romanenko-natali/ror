class ProjectsController < ApplicationController
  before_action :authenticate_user! # Make sure the user is authenticated

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end