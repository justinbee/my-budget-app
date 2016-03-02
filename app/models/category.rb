class Category < ApplicationRecord
	has_many :payees
	has_many :budgets_categories
	has_many :expenses, through: :budgets_categories
	has_many :transactions
	default_scope { order(:name) } 
end
