class CreatePurchaseStocks < ActiveRecord::Migration
  def change
    create_table :purchase_stocks do |t|
    	t.references	:purchase, index: true
    	t.references	:stock, index: true
    	t.integer	:piece
    	t.float		:net_weight
    	t.string	:remarks  
      t.timestamps
    end
  end
end
