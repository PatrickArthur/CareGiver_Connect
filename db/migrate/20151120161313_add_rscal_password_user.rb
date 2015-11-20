class AddRscalPasswordUser < ActiveRecord::Migration
  def up
    add_column :users, :rscale_password, :string
  end

  def down
    remove_column :users, :rscale_password, :string
  end
end
