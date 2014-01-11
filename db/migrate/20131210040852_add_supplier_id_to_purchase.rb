class AddSupplierIdToPurchase < ActiveRecord::Migration
  def change
  	add_column :purchases, :contact_id, :integer, references: :contacts
  	add_index  :purchases, :contact_id
  end
end
