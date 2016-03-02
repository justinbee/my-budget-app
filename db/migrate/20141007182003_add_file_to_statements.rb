class AddFileToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :file, :string
  end
end
