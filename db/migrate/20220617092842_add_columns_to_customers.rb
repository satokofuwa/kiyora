class AddColumnsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :prefecture, :string
    add_column :customers, :latitude, :float
    add_column :customers, :longitude, :float
  end
end
