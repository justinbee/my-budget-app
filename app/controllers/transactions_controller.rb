class TransactionsController < ApplicationController
	def index
		@transactions = Transaction.joins(:payee).joins(:category).select("transactions.id, amount, date, payees.name AS payee_name, categories.name AS category_name").take(25)
	end
end