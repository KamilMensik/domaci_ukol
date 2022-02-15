class CreateTaskTags < ActiveRecord::Migration[7.0]
  def change
    create_table :task_tags do |t|
      t.belongs_to :task, null: false
      t.belongs_to :tag, null: false

      t.timestamps
    end
  end
end
