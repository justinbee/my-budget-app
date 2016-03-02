class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :payee_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :fit_id
      t.string :type
      t.datetime :date
      t.integer :account_id
      t.integer :payee_id

      t.timestamps
    end
  end
end
