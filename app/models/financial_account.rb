require 'util'

class FinancialAccount < CowModel
	include ConvertMoney

	EXTERNAL = 1
    INTERNAL = 2
  
  ACCOUNT_TYPE = {
    EXTERNAL => "Externa",
    INTERNAL => "Interna"
  }
  
  ACCOUNT_TYPE_LIST = [["Externa", EXTERNAL],["Interna", INTERNAL]]

end
