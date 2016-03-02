class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :full_name
      t.date :birthday
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
