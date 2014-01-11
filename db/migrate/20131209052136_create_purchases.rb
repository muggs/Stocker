class CreatePurchases < ActiveRecord::Migration
  def change
    create_table	:purchases do |t|
    	t.string	:stone_type
    	t.string	:sub_type
    	t.string	:shape
    	t.integer	:piece
    	t.float		:net_weight
    	t.float		:purchase_price
    	t.float		:length
    	t.float		:breadth
    	t.float		:sarafa_weight
    	t.float		:gross_weight
    	t.float		:discount
    	t.date		:due_date
    	t.string	:remarks   	
      t.timestamps
    end
  end
end
