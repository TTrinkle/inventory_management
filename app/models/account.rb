class Account < ActiveRecord::Base
	belongs_to :user

	def pay_mom_in_full
		self.update(mom_pay: 0)
		self.save
	end
end
