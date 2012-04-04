class DentistsController < CowController
	inherit_resources

  def index
    @dentists = Dentist.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @dentists}
    end
  end

  def new
  	@dentist = Dentist.new
  	@dentist.dentist_specialties.build
  end

  def add_specialty
    ds = DentistSpecialties.new
    ds.dentist_id = params[:dentist_id]
    ds.specialty_id = params[:specialty_id]
    ds.save
    @dentist = Dentist.find(params[:dentist_id])
  end
end
