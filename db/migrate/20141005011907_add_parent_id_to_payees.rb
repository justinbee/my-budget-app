class AddParentIdToPayees < ActiveRecord::Migration
  def change
    add_column :payees, :parent_id, :integer
  end
end
