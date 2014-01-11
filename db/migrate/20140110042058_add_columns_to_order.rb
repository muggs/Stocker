class AddColumnsToOrder < ActiveRecord::Migration
  def change
  	add_column	:orders,	:due_date,	:date
  	add_column	:orders,	:discount,	:float
  	add_column	:orders,	:type,			:string
  end
end
