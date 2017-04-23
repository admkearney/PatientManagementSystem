class Request < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user
	belongs_to :clinic
end
