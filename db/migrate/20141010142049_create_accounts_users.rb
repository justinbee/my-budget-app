class CreateAccountsUsers < ActiveRecord::Migration
	def up
		create_table :accounts_users do |t|
			t.integer :account_id
			t.integer :user_id
			t.string :type
			t.boolean :selected, :default => false
			t.timestamps
		end
		remove_column :accounts, :user_id
	end

	def down
		add_column :accounts, :user_id, :integer
		drop_table :accounts_users
	end
end
