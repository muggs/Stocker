class AddingColumnsToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :contact_id, :integer, references: :contacts
  	add_column :sales, :stock_id, :integer, references: :stocks
  	add_column :sales, :piece, :integer
  	add_column :sales, :net_weight, :float
  	add_column :sales, :sale_price, :float
  	add_column :sales, :discount, :float
  	add_column :sales, :due_date, :date
  	add_column :sales, :remarks, :string
  	add_column :sales, :sale_type, :string
  	add_index  :sales, :contact_id
  	add_index  :sales, :stock_id
  end
end
