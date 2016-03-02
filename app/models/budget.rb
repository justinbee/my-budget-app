class Budget < ApplicationRecord
	has_many :budgets_users, dependent: :destroy
	has_many :users, through: :budgets_users
	has_many :transactions,  ->(budget) {where date: budget.start_date..(budget.end_date + 1.day)}, through: :users
	has_many :budgets_categories, dependent: :destroy
	has_many :expenses, through: :budgets_categories
	after_create :prepare_default_categories

	def category_expenses_amount(category)
		expenses.where(category_id: category.id).sum(:amount)
	end

	def transaction_amount 
		transactions.sum(:amount) + starting_balance
	end

	def remaining
		expenses.sum(:amount) + transactions.sum(:amount)
	end

	def estimated_balance
		expenses.sum(:amount) - starting_balance
	end

	def days
		[(end_date - start_date).to_i, 0].max
	end

	def days_elapsed
		date_to_compare = end_date < Date.today ? end_date : Date.today
		[(date_to_compare - start_date).to_i, 0].max
	end

	def days_remaining
		[days - days_elapsed, 0].max
	end

	def in
		transactions.where('amount > 0').sum(:amount)
	end

	def out
		transactions.where('amount < 0').sum(:amount)
	end

	def daily_in
		self.in / days
	end

	def daily_out
		self.out / days
	end

	def duplicate_expenses(other_budget)

		return nil if self == other_budget

		other_budget.budgets_categories.each do |other_bc|

			bc = self.budgets_categories.find_by_category_id(other_bc.category_id)

			next if bc.nil?

			other_bc.expenses.each do |e|
				bc.expenses.create(name: e.name, amount: e.amount)
			end
		end 
	end

	def update_category_positions
		budgets_categories.find_each do |bc|
			budget_category = BudgetsCategory.find bc.id
			budget_category.update_attribute(:position, position_for_category(budget_category.category.name))
		end
	end

	private
 		def prepare_default_categories
 			Category.all.each do |c|
 				self.budgets_categories.create(category_id: c.id, position: position_for_category(c.name))
 			end
 		end

 		def position_for_category(name)
 			@position_hash ||= {"Uncategorized" => 0, "Deposit" => 1}
 			@position_hash[name]
 		end
end
