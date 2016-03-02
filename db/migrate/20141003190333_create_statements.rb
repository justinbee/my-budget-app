class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :currency
      t.integer :account_id

      t.timestamps
    end
  end
end
