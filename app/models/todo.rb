class Todo < ApplicationRecord
  belongs_to :user
  has_many :project_tasks
  has_many :projects, through: :project_tasks
end
