class User < ApplicationRecord
    has_many :projects
    has_many :todos
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :password, presence: true, length: { minimum: 6, message: "password must be at least 6 characters long" }, allow_blank: true
    validates :password_confirmation, presence: true
end
