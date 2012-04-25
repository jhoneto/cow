require 'util'

class Estimate < CowModel
  include ConvertMoney	
  
  belongs_to :patient
  has_many :estimateprocedures , :class_name => "EstimateProcedure"
  accepts_nested_attributes_for :estimateprocedures

  def date_str
    self.date.to_s
  end

  def date_str=(value)
    self.date = value
  end

  
end
