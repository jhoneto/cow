class PaymentsController < CowController
	inherit_resources

	def index
    @payments = Payment.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @payments}
      end
    end
end
