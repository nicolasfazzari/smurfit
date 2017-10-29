class Indicator < ActiveRecord::Base
	self.inheritance_column = :foo

	validates :name, format: { with: /\A[a-z0-9\s]+\Z/i, message: "only allows letters,numbers or spaces" }
	validates :data, presence: true


end
