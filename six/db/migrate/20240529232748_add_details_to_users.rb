class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthdate, :date
    add_column :users, :registration_date, :datetime
  end
end
