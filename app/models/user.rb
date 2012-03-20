class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :account
  has_many :user_roles     
  
  scope :by_account, lambda {|account| {:conditions => {:account_id => 1} } }
end
