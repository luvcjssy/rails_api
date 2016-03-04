class AddPublishedInBooks < ActiveRecord::Migration
  def change
    add_column :books, :published, :boolean
  end
end
