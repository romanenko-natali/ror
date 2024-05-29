class Project < ApplicationRecord
    belongs_to :user
    has_many :project_tasks, dependent: :destroy
    has_many :tasks, through: :project_tasks

    validates :title, presence: true
end