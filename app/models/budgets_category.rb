class BudgetsCategory < ApplicationRecord

	belongs_to :budget
	belongs_to :category
	has_many :transactions, ->(budgets_category) {where date: budgets_category.budget.start_date..(budgets_category.budget.end_date + 1.day)}, through: :category
	has_many :expenses

	def transactions_amount
		transactions.sum(:amount)
	end	

	def expenses_amount
		expenses.sum(:amount)
	end

	def remaining
		expenses_amount + transactions_amount
	end

	def daily_average
		(transactions_amount/budget.days_elapsed.to_f).abs
	end

	def transaction_average
		(transactions_amount/transactions.count.to_f).abs
	end	
end
