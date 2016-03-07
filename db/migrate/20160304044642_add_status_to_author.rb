class AddStatusToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :status, :boolean
  end
end
