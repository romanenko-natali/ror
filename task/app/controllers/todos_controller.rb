class TodosController < ApplicationController
    before_action :require_login
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
    def index
      @todos = current_user.todos
    end
  
    def show
    end
  
    def new
      @todo = current_user.todos.build
    end
  
    def create
      @todo = current_user.todos.build(todo_params)
      if @todo.save
        redirect_to @todo, notice: 'Todo was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to @todo, notice: 'Todo was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @todo.destroy
      respond_to do |format|
        format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
   
    private
  
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end