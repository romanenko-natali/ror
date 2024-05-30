class Project < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :collaborators, class_name: 'User', join_table: 'projects_users'
  has_and_belongs_to_many :tasks
  validates :title, presence: true
  has_many :comments, as: :commentable
  has_many :project_memberships
  has_many :users, through: :project_memberships
end