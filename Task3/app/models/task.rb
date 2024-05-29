class Task < ApplicationRecord
  belongs_to :project, optional: true
  has_many :project_tasks
  has_many :projects, through: :project_tasks

  validates :title, presence: true
  validates :description, presence: true
end
