class ProjectsController < ApplicationController
    before_action :set_project, only: %i[ show edit update destroy ]
    before_action :authorize_user, only: %i[ edit update destroy ]

    # GET /projects or /projects.json
    def index
      @projects = Project.all
    end

    # GET /projects/1 or /projects/1.json
    def show
      @tasks = @project.tasks
    end

    # GET /projects/new
    def new
      @project = Project.new
    end

    # GET /projects/1/edit
    def edit
        @project = Project.find(params[:id])
    end


    # POST /projects or /projects.json
    def create
      @project = Project.new(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /projects/1 or /projects/1.json
    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /projects/1 or /projects/1.json
    def destroy
      @project.destroy!

      respond_to do |format|
        format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:title, :description, :user_id)
      end

      # Check if the current user owns the project BOOM
      def authorize_user
        redirect_to root_path, alert: "You are not authorized to perform this action." unless @project.user == current_user
      end
  end
