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
end
