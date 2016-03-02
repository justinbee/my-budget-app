class AddPositionToBudgetsCategories < ActiveRecord::Migration
  def change
    add_column :budgets_categories, :position, :integer
  end
end
