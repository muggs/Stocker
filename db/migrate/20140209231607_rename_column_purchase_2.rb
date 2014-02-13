class RenameColumnPurchase2 < ActiveRecord::Migration
  def change
  	rename_column	:purchases, :stone_type_desciption, :stone_type_description
  end
end
