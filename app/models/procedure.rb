require 'util'

class Procedure < CowModel 
  include ConvertMoney
  
  def price_br
    v = read_attribute(:price)
    if v.nil?
      0
    else
      to_format_br(v)
    end
  end

  def price_br=(price_br)
    write_attribute(:price, self.to_format_us(price_br))
  end
  
end
