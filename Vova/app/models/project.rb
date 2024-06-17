class Project < ApplicationRecord
  belongs_to :user
  has_many :project_tasks
  has_many :tasks, through: :project_tasks, dependent: :destroy

  has_many :project_users
  has_many :users, through: :project_users

  has_many :project_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true
end
