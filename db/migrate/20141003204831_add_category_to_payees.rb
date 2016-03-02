class AddCategoryToPayees < ActiveRecord::Migration
  def change
    add_column :payees, :category_id, :integer
  end
end
