class Clinic < ActiveRecord::Base
	has_many :patients
	has_many :requests
end
