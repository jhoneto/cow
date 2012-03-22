class SpecialtiesController < CowController
	inherit_resources

  def index
    @specialties = Specialty.search(params, current_user.account_id).paginate(:page => params[:page])

	respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @specialties}
    end
  end
end
