class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :content
      t.integer :student_id

      t.timestamps null:false
    end
  end
end
