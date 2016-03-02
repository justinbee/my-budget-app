class Transaction < ApplicationRecord
	belongs_to :account
	belongs_to :payee
	belongs_to :category, counter_cache: true

	 def self.ransackable_attributes(auth_object = nil)
 		super & %w(date name amount) 
 	end
end
