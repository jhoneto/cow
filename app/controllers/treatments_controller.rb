class TreatmentsController < CowController
  inherit_resources
  belongs_to :patient
  
  def index
    @treatments = Treatment.where("patient_id = ? and account_id = ?", params[:patient_id], current_user.account_id).paginate(:page => params[:page])
    @patient = Patient.find(params[:patient_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @treatments}
    end
  end

  def new
    @treatment  = Treatment.new 
    @patient = Patient.find(params[:patient_id])
    schedule = Schedule.find(params[:schedule_id])
    @treatment.dentist_id = schedule.dentist_id
    @treatment.date = Date.today
    2.times { @treatment.treatmentitems.build }
  end
end
