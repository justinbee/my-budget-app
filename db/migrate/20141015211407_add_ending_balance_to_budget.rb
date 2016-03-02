class AddEndingBalanceToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :ending_balance, :decimal, precision: 8, scale: 2
  end
end
