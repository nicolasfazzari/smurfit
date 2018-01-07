class Indicator < ActiveRecord::Base
	self.inheritance_column = :foo
	belongs_to :category
	validates :categroy, presence: true
	validates :name, presence: true
	validates :data, presence: true


end
