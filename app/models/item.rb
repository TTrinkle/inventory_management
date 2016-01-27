class Item < ActiveRecord::Base
	scope :red, -> {where(color: 'red')}
	scope :black, -> {where(color: 'black')}
	scope :white, -> {where(color: 'white')}
	scope :tshirt, -> {where(item_type: 'tshirt')}
	scope :vneck, -> {where(item_type: 'vneck')}
	scope :blanket, -> {where(item_type: 'blanket')}

	belongs_to :user
	def number
	end
end
