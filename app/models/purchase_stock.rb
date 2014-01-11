class PurchaseStock < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :purchase_id, :stock_id, :piece, :net_weight, :remarks  
  belongs_to	:purchase
  belongs_to	:stock
end
