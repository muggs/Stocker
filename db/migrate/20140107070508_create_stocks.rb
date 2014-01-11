class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
    	t.string	:stone_type
    	t.string	:sub_type
    	t.string	:shape
    	t.integer	:piece
    	t.float		:net_weight
    	t.float		:cost_price
    	t.float		:sell_price
    	t.float		:length
    	t.float		:breadth
    	t.float		:sarafa_weight
    	t.float		:gross_weight
    	t.string	:remarks
      t.timestamps
    end
  end
end
