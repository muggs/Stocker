class Purchase < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :contact_id, :stone_type, :stone_type_description, :stock_type, :shape, :piece, :net_weight, :purchase_price_per_ct, :size, :sarafa_weight, :gross_weight, :discount, :due_date, :remarks, :purchase_stocks_attributes, :broker_name  
  belongs_to	:contact
  has_many		:purchase_stocks
  accepts_nested_attributes_for :purchase_stocks, :allow_destroy => true
  
  def calculate_net_amount
  	if (! net_weight.blank? and ! purchase_price_per_ct.blank? and ! discount.blank?)
  			return((net_weight * purchase_price_per_ct) * (100 - discount) / 100)
  	else
  			return 0
  	end
	end
end
