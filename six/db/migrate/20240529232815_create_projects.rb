# db/migrate/20240529232815_create_projects.rb

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      # Remove the line below as 'created_at' is already included by default
      # t.datetime :created_at 

      t.timestamps
    end
  end
end
