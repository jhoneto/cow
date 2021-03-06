class TreatmentItem < ActiveRecord::Base
	belongs_to :treatment
	belongs_to :procedure

	attr_accessor :procedure_name

	def procedure_name
	  Procedure.find_by_id(self.procedure_id).name unless self.procedure_id.nil?
	end

end
