class CreateBudgetsUsers < ActiveRecord::Migration
  def up
    create_table :budgets_users do |t|
      t.integer :budget_id
      t.integer :user_id
      t.string :type
      t.boolean :selected, default: false

      t.timestamps
    end

    remove_column :users, :selected_budget_id
    remove_column :budgets, :user_id
  end

  def down
  	add_column :users, :selected_budget_id, :integer
  	add_column :budgets, :user_id, :integer
	drop_table :budgets_users
  end
end
