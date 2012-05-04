class TreatmentsController < CowController
	inherit_resources

	autocomplete :patient, :name, :extra_data => [:id], :full => true
	autocomplete :procedure, :name, :extra_data => [:id, :price], :full => true

	def index
	  @treatments = Treatment.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @treatments}
      end
	end

	def new
      @treatment  = Treatment.new
      5.times { @treatment.treatmentitems.build }
    end
end
