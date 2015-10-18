class Letter < ActiveRecord::Base

	def remove_one
		self.number -= 1
		self.save
	end

end
