class AddSelectedBudgetToUser < ActiveRecord::Migration
	def change
		add_column :users, :selected_budget_id, :integer
	end
end
