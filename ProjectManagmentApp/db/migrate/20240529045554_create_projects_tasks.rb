class CreateProjectsTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
