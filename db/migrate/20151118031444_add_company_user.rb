class AddCompanyUser < ActiveRecord::Migration
  def up
    add_column :users, :company, :string
  end

  def down
    remove_column :users, :company, :string
  end
end
