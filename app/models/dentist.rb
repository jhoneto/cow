class Dentist < CowModel
	has_many :dentist_specialties, :class_name => "DentistSpecialties", :foreign_key => "dentist_id"
	has_many :specialties, :class_name => "Specialty", :through => :dentist_specialties

	accepts_nested_attributes_for :dentist_specialties 
end
