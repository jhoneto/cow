class EstimateProcedure < ActiveRecord::Base
	belongs_to :estimate
	belongs_to :procedure

	attr_accessor :procedure_name
	attr_accessor :item_total

	def item_total
	  self.value*self.amount unless (self.value.nil? || self.amount.nil?)
	end

	def procedure_name
	  Procedure.find(self.procedure_id).name unless self.procedure_id.nil?
	end
end
