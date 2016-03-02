class Account < ApplicationRecord
	has_many :accounts_users, dependent: :destroy
	has_many :users, through: :accounts_users
	has_many :statements, dependent: :destroy
	has_many :transactions, dependent: :destroy
	has_many :payees, through: :transactions
end
