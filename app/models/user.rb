class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :account
  has_many :user_roles
end
