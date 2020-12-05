class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :gender
      t.string :email
      t.string :nickname
      t.date :birth_date
      t.string :password

      t.timestamps
    end
  end
end
