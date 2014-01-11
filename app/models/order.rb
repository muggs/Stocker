class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :contact_id, :order_date, :due_date, :discount, :order_type, :remarks, :order_details_attributes 
  belongs_to	:contact
  has_many		:order_details
  accepts_nested_attributes_for :order_details, :allow_destroy => true
end
