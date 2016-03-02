class User < ApplicationRecord
	has_secure_password
	has_many :accounts_users, dependent: :destroy
	has_many :accounts, through: :accounts_users
	has_many :transactions, through: :accounts
	has_many :budgets_users, dependent: :destroy
	has_many :budgets, through: :budgets_users
	has_one :selected_budget, class_name: "Budget"
	before_save :create_remember_token
	before_save { |user| user.email = user.email.downcase }
	has_one :selected_accounts_user, -> {where selected: true}, class_name: 'AccountsUser'
	has_one :selected_account, through: :selected_accounts_user, source: :account
	has_one :selected_budgets_user, -> {where selected: true}, class_name: 'BudgetsUser'
	has_one :selected_budget, through: :selected_budgets_user, source: :budget

	validates :name,  presence: true, length: { maximum: 150 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX},
						uniqueness: {case_sensitive: false}						

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end		
end
