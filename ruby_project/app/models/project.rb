class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  has_many :tasks, dependent: :destroy
end
