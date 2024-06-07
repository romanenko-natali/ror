class Task < ApplicationRecord
  belongs_to :project, optional: true
  has_many :task_comments, dependent: :destroy
  has_many :project_tasks, dependent: :destroy
  has_many :projects, through: :project_tasks

  validates :title, presence: true
  validates :description, presence: true
end
