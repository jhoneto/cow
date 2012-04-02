class Specialty < CowModel
	has_many :dentist_specialties, :class_name => "DentistSpecialties", :foreign_key => "specialty_id"
	has_many :dentists, :class_name => "Dentist", :through => :dentist_specialties
end
