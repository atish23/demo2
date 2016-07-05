class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address1
      t.text :address2
      t.string :zipcode
      t.string :city

      t.timestamps null: false
    end
  end
end
