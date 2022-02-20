class AddFileToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :file, :string
  end
end
