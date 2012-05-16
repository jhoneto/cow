class EstimatePayment < ActiveRecord::Base
	belongs_to :estimate
	
	attr_accessor :payment_name
	
	def payment_name
	  Payment::PAYMENT_TYPE[self.payment_type]
  end
end
