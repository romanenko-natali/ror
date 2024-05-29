class CreateTaskElems < ActiveRecord::Migration[7.1]
  def change
    create_table :task_elems do |t|
      t.string :title
      t.text :description
      t.boolean :published
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
