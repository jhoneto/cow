require 'util'

class Estimate < CowModel
  include ConvertMoney	
  
  belongs_to :patient
  has_many :estimateprocedures , :class_name => "EstimateProcedure"
  has_many :estimatepayments , :class_name => "EstimatePayment"
  accepts_nested_attributes_for :estimateprocedures, :reject_if => lambda { |a| a[:procedure_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :estimatepayments, :reject_if => lambda { |a| a[:payment_id].blank? }, :allow_destroy => true

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
