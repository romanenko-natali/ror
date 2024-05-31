class TaskElemsController < ApplicationController
  before_action :set_task_elem, only: %i[ show edit update destroy ]

  def index
    @task_elems = TaskElem.all
  end

  def show
    @projects = Project.all
  end

  def new
    @task_elem = TaskElem.new
    @projects = Project.all
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
   else
      @project = nil
  end
  end

  def edit
     @projects = Project.all
  end

  def create
    @task_elem = TaskElem.new(task_elem_params)

    respond_to do |format|
      if @task_elem.save
        format.html { redirect_to task_elem_url(@task_elem), notice: "Task elem was successfully created." }
        format.json { render :show, status: :created, location: @task_elem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_elem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task_elem.update(task_elem_params)
        format.html { redirect_to task_elem_url(@task_elem), notice: "Task elem was successfully updated." }
        format.json { render :show, status: :ok, location: @task_elem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_elem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_elem.destroy!

    respond_to do |format|
      format.html { redirect_to task_elems_url, notice: "Task elem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task_elem
      @task_elem = TaskElem.find(params[:id])
    end


    def task_elem_params
      params.require(:task_elem).permit(:title, :description, :published, :project_id)
    end
end
