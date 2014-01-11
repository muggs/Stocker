class AddStockNoToStock < ActiveRecord::Migration
  def change
  	add_column	:stocks,	:stock_no,	:string
  end
end
