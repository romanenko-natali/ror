# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_commentable, only: :create

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_back fallback_location: root_path, notice: 'Comment was successfully created.'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to create comment.'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable
    @commentable = if params[:project_id]
                     Project.find(params[:project_id])
                   elsif params[:task_id]
                     Task.find(params[:task_id])
                   end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
