class Indicator < ActiveRecord::Base
	self.inheritance_column = :foo

	validates :name, presence: true
	validates :data, presence: true


end
