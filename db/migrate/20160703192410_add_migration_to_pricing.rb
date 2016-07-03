class AddMigrationToPricing < ActiveRecord::Migration
  def change
    add_column :pricings, :iron, :boolean
    add_column :pricings, :washandiron, :boolean
  end
end
