
class Payment < CowModel

  MONEY = 1
  CHECK = 2
  CREDIT_CARD = 3
  DEBIT_CARD = 4
  
  PAYMENT_TYPE = {
    MONEY => "Dinheiro",
    CHECK => "Cheque",
    CREDIT_CARD => "Cartao de credito",
    DEBIT_CARD => "Cartao de debito"
  }
  
  PAYMENT_TYPE_LIST = [["Dinheiro", MONEY],["Cheque", CHECK],["Cartao de credito", CREDIT_CARD],["Cartao de debito", DEBIT_CARD]]
end
