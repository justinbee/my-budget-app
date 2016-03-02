class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :type
      t.string :number
      t.decimal :balance, :precision => 8, :scale => 2
      t.datetime :balance_date
      t.integer :user_id

      t.timestamps
    end
  end
end
