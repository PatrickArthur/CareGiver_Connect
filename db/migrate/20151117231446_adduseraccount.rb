class Adduseraccount < ActiveRecord::Migration
  def up
    add_column :users, :account, :integer
  end

  def down
    remove_column :users, :account, :integer
  end
end
