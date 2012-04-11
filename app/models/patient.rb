class Patient < CowModel         

	attr_accessor :date_of_birth_str

	def date_of_birth_str
		self.date_of_birth.to_s
	end

	def date_of_birth_str=(value)
		self.date_of_birth = value
	end
 
end
