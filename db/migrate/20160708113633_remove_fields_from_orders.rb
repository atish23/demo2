class RemoveFieldsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :address1, :text
    remove_column :orders, :address2, :text
    remove_column :orders, :city, :string
    remove_column :orders, :zipcode, :string
  end
end
