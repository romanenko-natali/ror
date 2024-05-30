class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      # Skip the addition of columns that already exist
      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""
      
      # Add only the Devise columns that are not present yet
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)
      t.integer  :sign_in_count, default: 0, null: false unless column_exists?(:users, :sign_in_count)
      t.datetime :current_sign_in_at unless column_exists?(:users, :current_sign_in_at)
      t.datetime :last_sign_in_at unless column_exists?(:users, :last_sign_in_at)
      t.string   :current_sign_in_ip unless column_exists?(:users, :current_sign_in_ip)
      t.string   :last_sign_in_ip unless column_exists?(:users, :last_sign_in_ip)

      # Uncomment if you are using confirmable or lockable modules
      # t.string   :confirmation_token unless column_exists?(:users, :confirmation_token)
      # t.datetime :confirmed_at unless column_exists?(:users, :confirmed_at)
      # t.datetime :confirmation_sent_at unless column_exists?(:users, :confirmation_sent_at)
      # t.string   :unconfirmed_email unless column_exists?(:users, :unconfirmed_email) # Only if using reconfirmable
      # t.integer  :failed_attempts, default: 0, null: false unless column_exists?(:users, :failed_attempts) # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token unless column_exists?(:users, :unlock_token) # Only if unlock strategy is :email or :both
      # t.datetime :locked_at unless column_exists?(:users, :locked_at)

      # If your User model already has timestamps, comment out below line.
      # t.timestamps null: false
    end

    # Add indices for Devise columns if they do not already exist
    add_index :users, :email,                unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # Uncomment the following lines if you add confirmable or lockable columns above
    # add_index :users, :confirmation_token,   unique: true unless index_exists?(:users, :confirmation_token)
    # add_index :users, :unlock_token,         unique: true unless index_exists?(:users, :unlock_token)
  end

  def self.down
    # If you added timestamps, remove the comment below
    # remove_timestamps :users

    change_table :users do |t|
      # Remove any columns that should be removed in a rollback
      # t.remove :email
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
      t.remove :sign_in_count
      t.remove :current_sign_in_at
      t.remove :last_sign_in_at
      t.remove :current_sign_in_ip
      t.remove :last_sign_in_ip
      # Uncomment if you are using confirmable or lockable modules
      # t.remove :confirmation_token
      # t.remove :confirmed_at
      # t.remove :confirmation_sent_at
      # t.remove :unconfirmed_email
      # t.remove :failed_attempts
      # t.remove :unlock_token
      # t.remove :locked_at
    end
  end
end
