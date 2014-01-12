class AddUserIdToExpense < ActiveRecord::Migration
  def change
  	add_column :expenses, :user_id, :integer, references: :user
  	add_index  :expenses, :user_id
  end
end
