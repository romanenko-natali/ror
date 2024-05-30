# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(name: 'John', email: 'john@example.com', password: 'password')).to be_valid
  end

  it 'is not valid without a name' do
    expect(User.new(email: 'john@example.com', password: 'password')).to_not be_valid
  end
end
