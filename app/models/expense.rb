class Expense < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible	:expense_type, :expense_date, :description, :vendor_name, :city, :state, :amount, :remarks, :user_id
  belongs_to :user
  
  validates :expense_type, presence: true
  validates :expense_date, presence: true
  validates :vendor_name, presence: true
  validates :amount, presence: true
end
