class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :political_affiliation
      t.integer :median_income
      t.string :education
      t.string :profession
      t.string :marital_status
      t.string :social_media
      t.string :hours_television
      t.integer :books_year
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :phone
      t.string :email
      t.string :gender
      t.integer :age
      t.string :race
      t.string :ethnicity
      t.string :language
      t.boolean :us_citizen
      t.boolean :non_us_citizen
      t.text :description
      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
