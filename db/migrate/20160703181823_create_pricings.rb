class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.string :name
      t.string :price
      t.string :category

      t.timestamps null: false
    end
  end
end
