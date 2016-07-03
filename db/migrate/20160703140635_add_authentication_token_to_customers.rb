class AddAuthenticationTokenToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :auth_token, :string, default: ""
    add_index :customers, :auth_token
  end
end
