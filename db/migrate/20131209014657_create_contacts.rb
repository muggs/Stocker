class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :name, 						:length => 30
    	t.string :company, 					:length => 30
    	t.string :street_address, 	:length => 200
    	t.string :city, 						:length => 50
    	t.string :state, 						:length => 50
    	t.string :country, 					:length => 50
    	t.string :postal_code, 			:length => 10
    	t.string :email, 						:length => 100
    	t.string :contact_number_1, :length => 20
    	t.string :contact_number_2, :length => 20
    	t.string :fax_number, 			:length => 20
    	t.timestamps
    end
  end
end
