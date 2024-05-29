class Project < ApplicationRecord
  has_many :task_elems, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
