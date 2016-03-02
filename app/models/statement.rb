class Statement < ApplicationRecord
	belongs_to :account
	mount_uploader :file, StatementUploader
end
