class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
  	  t.references :order, index: true
    	t.references :stock, index: true
    	t.integer	:piece
    	t.float		:net_weight
    	t.float		:sell_price
    	t.string	:remarks    	
      t.timestamps
    end
  end
end
