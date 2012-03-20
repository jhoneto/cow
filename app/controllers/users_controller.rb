class UsersController < CowController
  inherit_resources
  
  has_scope :by_account       
  
  
end
