class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.datetime :pickup_date
      t.text :address1
      t.text :address2
      t.string :city
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
