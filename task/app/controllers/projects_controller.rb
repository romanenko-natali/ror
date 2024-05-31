class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    if @project.editable_by?(current_user)
      @editable = true
    else
      @editable = false
    end
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if project_params[:todo_ids].nil? || project_params[:todo_ids].empty?
      @project.todos.clear
    else
      @project.update(project_params)
    end

    if @project.update(project_params)
      redirect_to @project, notice: 'Project successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def set_project
    @project = Project.find(params[:id])
  end  

  def project_params
    params.require(:project).permit(:title, :description, todo_ids: [])
  end
end
