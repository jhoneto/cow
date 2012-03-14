require 'rake'

namespace :cow do 

	task :create_account, [:email, :name] => :environment do |t, args| 
	  account = Account.create({:name => "Nome da conta"})
    user = User.create({:email => args.email, :name => args.name, 
                        :account_id => account.id, :password => "admin"})  
  end
end
