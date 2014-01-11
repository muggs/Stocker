class Purchase < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :contact_id, :stone_type, :sub_type, :shape, :piece, :net_weight, :purchase_price, :length, :breadth, :sarafa_weight, :gross_weight, :discount, :due_date, :remarks, :purchase_stocks_attributes  
  belongs_to	:contact
  has_many		:purchase_stocks
  accepts_nested_attributes_for :purchase_stocks, :allow_destroy => true
end
