module ConvertMoney
  def to_format_br(valor)    
    valor = valor.to_s.gsub('.',',')
    d = valor[(valor.rindex(',')+1)..-1]       

    if d.length < 2
      valor = valor + '0'
    end
    valor
  end
   
  def to_format_us(valor)
    valor = valor.gsub('.', '').gsub(',', '.')
    valor
  end
end