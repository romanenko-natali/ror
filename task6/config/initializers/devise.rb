require 'devise/orm/active_record'

# Custom serialization strategy for Devise
class CustomSerializationStrategy
  def serialize(record)
    [record.to_key, record.authenticatable_salt]
  end

  def deserialize(keys)
    record = User.find(keys.first.first)
    record if record&.authenticatable_salt == keys.last
  end
end

# Configure Devise to use the custom serialization strategy
Devise.setup do |config|
  # Other Devise configurations...

  # Use custom serialization strategy
  config.warden do |manager|
    manager.serialize_into_session { |user| user.id }
    manager.serialize_from_session { |id| User.find_by(id: id) }
  end

  config.authentication_keys = [:email]
end