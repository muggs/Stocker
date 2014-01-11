class Stock < ActiveRecord::Base
  # attr_accessible :title, :body
    attr_accessible :stock_no, :stone_type, :sub_type, :shape, :piece, :net_weight, :cost_price, :sell_price, :length, :breadth, :sarafa_weight, :gross_weight, :remarks
    has_many	:order_details
    has_many	:purchase_stocks
  end
