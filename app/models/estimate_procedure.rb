require 'util'

class EstimateProcedure < ActiveRecord::Base
  include ConvertMoney
  
	belongs_to :estimate
	belongs_to :procedure

	attr_accessor :procedure_name
	attr_accessor :item_total

	def item_total
	  self.value*self.amount unless (self.value.nil? || self.amount.nil?)
	end

	def procedure_name
	  Procedure.find(self.procedure_id).name unless self.procedure_id.nil?
	end     
	
	def value_br
    v = read_attribute(:value)
    if v.nil?
      0
    else
      to_format_br(v)
    end
  end

  def value_br=(value_br)
    write_attribute(:value, self.to_format_us(value_br))
  end
end
