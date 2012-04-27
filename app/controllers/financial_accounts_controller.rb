class FinancialAccountsController < CowController
	inherit_resources

	def index
    @financial_accounts = FinancialAccount.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @financial_accounts}
      end
    end
end
