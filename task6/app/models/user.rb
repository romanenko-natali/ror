class User < ApplicationRecord
  has_many :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define how to serialize and deserialize user from session
  def self.serialize_from_session(key, salt)
    record = to_adapter.get(key)
    record if record && record.authenticatable_salt == salt
  end

  # Define the authenticatable_salt method
  def authenticatable_salt
    # Replace this with the correct method for retrieving the salt used for password encryption
    # If you're using Devise, it should be encrypted_password_salt
    # If you're using a different authentication gem or method, replace it accordingly
    encrypted_password
  end
end