class Patient < ActiveRecord::Base
	belongs_to :user
	belongs_to :clinic
end
