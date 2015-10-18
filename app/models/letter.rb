class Letter < ActiveRecord::Base

	def remove_one
		self.number -= 1
		self.save
	end

	def add_set
		self.number += 10
		self.save
	end
	
end
