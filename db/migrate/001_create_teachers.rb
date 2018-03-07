class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :info
    end
  end
end
