class RenameColumnPurchase1 < ActiveRecord::Migration
  def change
  	rename_column	:purchases, :sub_type, :stock_type
  end
end
