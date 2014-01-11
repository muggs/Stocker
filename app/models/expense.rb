class Expense < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible	:expense_type, :expense_date, :description, :vendor_name, :city, :state, :amount, :remarks
end
