class Task < ApplicationRecord
  has_many :project_tasks, dependent: :destroy
  has_many :projects, through: :project_tasks

  validates :title, presence: true
end
