class Project < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tasks
  validates :title, presence: true
  validates :description, presence: true
end