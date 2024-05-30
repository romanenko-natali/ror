# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations
  has_many :projects
  has_many :tasks
  has_many :comments
  has_many :project_memberships
  has_many :joined_projects, through: :project_memberships, source: :project

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :birthdate, presence: true
end
