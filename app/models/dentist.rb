class Dentist < CowModel
  validates_presence_of :name, :on => :create, :message => "can't be blank"
	has_many :dentist_specialties, :class_name => "DentistSpecialties", :foreign_key => "dentist_id"
	has_many :specialties, :class_name => "Specialty", :through => :dentist_specialties
	has_many :timetables, :class_name => "Timetable", :foreign_key => "dentist_id"
	has_many :schecules, :class_name => "Schecule", :foreign_key => "dentist_id"
end
