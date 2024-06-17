
class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @project_comment = ProjectComment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path, notice: 'Project was successfully deleted.'
  end

  def invite
    set_project
    user = User.find_by(email: params[:email])
    if user && @project
      @project.users << user unless @project.users.include?(user)
      redirect_to @project, notice: "#{user.email} has been added to the project."
    else
      redirect_to @project, alert: "User not found."
    end
  end

  def uninvite
    set_project
    user = User.find(params[:user_id])
    
    if @project.users.include?(user)
      @project.users.delete(user)
      redirect_to @project, notice: "#{user.email} has been uninvited from the project."
    else
      redirect_to @project, alert: "#{user.email} is not a collaborator on this project."
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
