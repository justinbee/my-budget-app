class AddTransactionsCountToCategories < ActiveRecord::Migration
	def up
		add_column :categories, :transactions_count, :integer, :default => 0

		Category.reset_column_information

		Category.all.each do |c|
			Category.update_counters c.id, :transactions_count => c.transactions.count
		end   
	end

	def down
  		remove_column :categories, :transactions_count
  	end
end
