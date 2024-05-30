# db/migrate/20240529234222_create_comments.rb

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, null: false
      # Remove the line below as 'created_at' is already included by default
      # t.datetime :created_at 

      t.timestamps
    end
  end
end
