class AddStartingBalanceToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :starting_balance, :decimal, :precision => 8, :scale => 2
  end
end
