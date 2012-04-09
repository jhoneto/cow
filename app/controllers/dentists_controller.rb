class DentistsController < CowController
	inherit_resources

  custom_actions :resource => [:add_specialty, :remove_specialty]


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
  
  def remove_specialty
    ds = DentistSpecialties.find(params[:id])
    dentist_id = ds.dentist_id
    ds.destroy
    @dentist = Dentist.find(dentist_id)
  end
  
  def add_horary
    time = Timetable.new
    time.dentist_id = params[:dentist_id]
    time.day_week = params[:day_week]
    time.start_time = params[:start_time]
    time.stop_time = params[:stop_time]
    time.save
    @dentist = Dentist.find(params[:dentist_id])
  end
  
  def remove_horary
    time = Timetable.find(params[:id])
    dentist_id = time.dentist_id
    time.destroy
    @dentist = Dentist.find(dentist_id)
  end
end
