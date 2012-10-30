class AddUserToFileStore < ActiveRecord::Migration
  def change
    add_column :file_stores, :user_id, :integer
    add_column :file_stores, :user_uname, :string
  end
end
