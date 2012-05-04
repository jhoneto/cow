class Treatment < CowModel

	belongs_to :dentist
	belongs_to :patient
	belongs_to :estimate
	belongs_to :schedule
	has_many   :treatmentitems , :class_name => "TreatmentItem"
	accepts_nested_attributes_for :treatmentitems, :reject_if => lambda { |a| a[:tooth].blank? }, :allow_destroy => true
	attr_accessor :patient_name

	def patient_name
      Patient.find(self.patient_id).name unless self.patient_id.nil?
    end

    def date_str
      self.date.to_s
    end

    def date_str=(value)
      self.date = value
    end
end
