class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :title, null: false
      t.belongs_to :user, null: false
      
      t.timestamps
    end
  end
end
