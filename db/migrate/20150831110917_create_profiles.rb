class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :address
      t.text :bio
      t.string :gender
      t.string :placeofbirth
      t.string :countryofbirth

      t.timestamps null: false
    end
  end
end
