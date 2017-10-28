class Indicator < ActiveRecord::Base
	self.inheritance_column = :foo

	validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :data, presence: true


end
