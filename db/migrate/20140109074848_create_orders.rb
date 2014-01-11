class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.date		:order_date
    	t.string	:remarks
    	t.references :contact, index: true
      t.timestamps
    end
  end
end
