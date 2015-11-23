class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|

      t.integer  :user_id, default: 0, null: false
      t.string :name,              null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps null: false

    end

    add_index :deployments, :name,                unique: true
  end
end
