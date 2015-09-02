class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :sapid
      t.string :fname
      t.string :lname
      t.string :email
      t.string :mobile
      t.string :username

      t.timestamps null: false
    end
  end
end
