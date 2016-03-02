class CreateBudgetsCategories < ActiveRecord::Migration
  def change
    create_table :budgets_categories do |t|
      t.integer :budget_id
      t.integer :category_id

      t.timestamps
    end

    add_column :expenses, :budgets_category_id, :integer
    BudgetsCategory.reset_column_information
    Expense.reset_column_information

    Expense.all.each do |e|
      BudgetsCategory.where(budget_id: e.budget_id, category_id: e.category_id).first_or_create.tap do |bc|
        bc.expenses << e
      end
    end

    remove_column :expenses, :budget_id
    remove_column :expenses, :category_id
  end
end
