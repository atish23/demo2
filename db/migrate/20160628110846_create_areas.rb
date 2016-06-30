class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :zip_code
      t.string :name
      t.string :city
      t.boolean :active

      t.timestamps null: false
    end
  end
end
