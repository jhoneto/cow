class Group < CowModel

	has_many :procedures , :class_name => "Procedure"

	has_attached_file :image, :styles => { :thumb => "135x36>" }
end
