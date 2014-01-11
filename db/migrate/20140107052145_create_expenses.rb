class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.string	:expense_type
    	t.date		:expense_date
    	t.string	:description
    	t.string	:vendor_name
    	t.string	:city
    	t.string	:state
    	t.float 	:amount
    	t.string	:remarks   	
      t.timestamps
    end
  end
end
