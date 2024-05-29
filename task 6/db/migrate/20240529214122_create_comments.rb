class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :text
      t.integer :article_id

      t.timestamps
    end
  end
end
