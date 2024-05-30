class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_and_belongs_to_many :projects
  validates :title, presence: true
end