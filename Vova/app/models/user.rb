class User < ApplicationRecord
    has_many :project_users
    has_many :projects
    has_secure_password
    has_many :invitations, class_name: "ProjectUser", foreign_key: "user_id"
    has_many :invited_projects, through: :invitations, source: :project
    
    has_many :project_comments, dependent: :destroy
    has_many :task_comments, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
