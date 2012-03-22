class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :account
  has_many :user_roles

  def self.search(parameters, account)
    query = self.scoped
    query = query.where('account_id = ?', account)
    parameters.each do |parameter, value|
      if not value.empty? and query.respond_to? parameter
        query = query.send(parameter, value)
      end
    end
    query
  end

end
