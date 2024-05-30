# db/migrate/20240529232825_create_tasks.rb

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      # Remove the line below as 'created_at' is already included by default
      # t.datetime :created_at 

      t.timestamps
    end
  end
end
