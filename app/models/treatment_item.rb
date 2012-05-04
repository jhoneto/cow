class TreatmentItem < ActiveRecord::Base
	belongs_to :treatment

	attr_accessor :procedure_name

	def procedure_name
	  Procedure.find(self.procedure_id).name unless self.procedure_id.nil?
	end
end
