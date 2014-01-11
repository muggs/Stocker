class Sale < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :contact_id, :stock_id, :piece, :net_weight, :sale_price, :discount, :due_date, :remarks, :sale_type  
  belongs_to	:contact
  belongs_to	:stock
end
