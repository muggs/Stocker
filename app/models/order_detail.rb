class OrderDetail < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :stock_id, :piece, :net_weight, :sell_price, :remarks  
  belongs_to	:order
  belongs_to	:stock
end
