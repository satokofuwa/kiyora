class AddColumnsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :prefecture, :string
  end
end
