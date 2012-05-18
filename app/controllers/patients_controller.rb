class PatientsController < CowController
	inherit_resources
	
	autocomplete :patient, :name, :extra_data => [:id], :full => true

  def index
    @patients = Patient.search(params, current_user.account_id).paginate(:page => params[:page])

	respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @patients}
    end
  end
end
