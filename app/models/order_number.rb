class OrderNumber < ActiveRecord::Base
	has_many :orders
	belongs_to :user
end
