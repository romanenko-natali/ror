class Project < ApplicationRecord
  belongs_to :user
  has_many :project_tasks
  has_many :todos, through: :project_tasks

  def editable_by?(current_user)
    user == current_user
  end
end

