class Task < ApplicationRecord
  has_and_belongs_to_many :projects

  validates :title, presence: true
  validates :description, presence: true
end
