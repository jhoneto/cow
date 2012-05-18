class EstimatesController < CowController
	inherit_resources

	autocomplete :patient, :name, :extra_data => [:id], :full => true
	

	def index
	  @estimates = Estimate.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @dentists}
      end
	end

	def new
      @estimate  = Estimate.new
      5.times { @estimate.estimateprocedures.build }
      3.times { @estimate.estimatepayments.build }
  end

end
