class Patient < CowModel
  
  has_many :treatments, :class_name => "Treatment", :foreign_key => "patient_id"

	attr_accessor :date_of_birth_str

	def date_of_birth_str
		self.date_of_birth.to_s
	end

	def date_of_birth_str=(value)
		self.date_of_birth = value
	end
 
end
