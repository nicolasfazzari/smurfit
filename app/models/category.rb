class Category < ActiveRecord::Base
	has_many :indicators
	has_many :documentations
end
