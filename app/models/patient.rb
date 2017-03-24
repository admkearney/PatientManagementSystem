class Patient < ActiveRecord::Base
	belongs_to :user
	belongs_to :clinic
	has_many :requests
end
