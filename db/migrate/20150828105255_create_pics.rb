class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :imageuri
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
