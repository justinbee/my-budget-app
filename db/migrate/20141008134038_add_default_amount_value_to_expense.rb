class AddDefaultAmountValueToExpense < ActiveRecord::Migration
	def up
		change_column :expenses, :amount, :decimal, :precision => 8, :scale => 2, :default => 0
	end
	def down
		change_column :expenses, :amount, :decimal, :precision => 8, :scale => 2
	end
end
