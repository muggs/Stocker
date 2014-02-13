class AddBrokerToPurchase < ActiveRecord::Migration
  def change
  	add_column :purchases, :broker_name, :string
  end
end
