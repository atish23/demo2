class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :iron, :string
    add_column :orders, :wash_iron, :string
  end
end
