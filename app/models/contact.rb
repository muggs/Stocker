class Contact < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible	:contact_type, :name,	:company, :street_address, :city,	:state, :country, :postal_code,	:email, :contact_number_1,	:contact_number_2,	:fax_number
  validates :name, presence: true
  validates :company, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :contact_number_1, presence: true
end
