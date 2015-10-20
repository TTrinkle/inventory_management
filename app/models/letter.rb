class Letter < ActiveRecord::Base
	validates :name, inclusion: { in: %w(alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron pi rho sigma tau upsilon phi chi psi omega)}
	validates :position, inclusion: { in: %w(top botom other)}

	def remove_one
		self.number -= 1
		self.save
	end

	def add_set
		self.number += 10
		self.save
	end
	
end
