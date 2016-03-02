class PrepopulateCategories < ActiveRecord::Migration
	def up
		rename_column :categories, :type, :name
		
		categories = 
			"Auto/Transportation",
			"Bills/Utilities",
			"Business/Office",
			"Cash/ATM",
			"Children",
			"Entertainment",
			"Food/Drink",
			"Health",
			"Home",
			"Insurance/Financial",
			"Miscellaneous",
			"Personal Care",
			"Pets",
			"Shopping",
			"Taxes",
			"Travel",
			"Uncategorized",
			"Credit Card/Loan Payment",
			"Transfer",
			"Deposit"

		categories.each do |c|
			Category.create!(name: c)
		end
	end
	def down
		rename_column :categories, :name, :type
	end
end
