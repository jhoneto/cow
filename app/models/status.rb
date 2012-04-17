class Status <ActiveRecord::Base
    
  AGENDADO = 1
  CONFIRMADO = 2
  CANCELADO = 3
  
  STATUS = {
    AGENDADO => "Agendado",
    CONFIRMADO => "Confirmado",
    CANCELADO => "Cancelado"
  }
  
  STATUS_LIST = [["Agendado", AGENDADO],["Confirmado", CONFIRMADO], ["Cancelado", CANCELADO]]
end