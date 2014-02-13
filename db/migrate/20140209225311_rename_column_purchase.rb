class RenameColumnPurchase < ActiveRecord::Migration
  def change
  	remove_column :purchases, :length, :breadth
  	add_column		:purchases, :stone_type_desciption, :string
  	add_column		:purchases, :size, :string
  	rename_column	:purchases, :purchase_price, :purchase_price_per_ct
  end
end
