class Role <ActiveRecord::Base
    
  ATTENDANT = 1
  DENTIST = 2
  MANAGER = 3
  ADMIN = 99
  
  ROLE = {
    ATTENDANT => "Atendente",
    DENTIST => "Dentista",
    MANAGER => "Gerente",
    ADMIN => "Administrador"
  }
  
   
  ROLE_LIST = [["Atendente", ATTENDANT], ["Dentista", DENTIST], ["Gerente", MANAGER], ["Administrador", ADMIN]]
end
