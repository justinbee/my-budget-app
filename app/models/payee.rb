class Payee < ApplicationRecord
	has_many :transactions
	has_many :children, class_name: "Payee", foreign_key: "parent_id"
 	belongs_to :parent, class_name: "Payee"
 	belongs_to :category
 	after_create :set_category


 	def update_transactions_category(category_was)
 		transactions.each { |t| category.transactions << t if t.category == category_was}
 	end

 	def self.ransackable_attributes(auth_object = nil)
 		super & %w(name) 
 	end

 	private
 		def set_category
 			return if self.category
 			uncategorized = Category.find_by_name "Uncategorized"
 			uncategorized.payees << self unless uncategorized.nil?
 		end
end
