class AddUserType < ActiveRecord::Migration
  def up
    add_column :users, :user_type, :boolean, :default => nil
  end

  def down
    remove_column :users, :user_type, :boolean, :default => nil
  end
end
