class SchedulesController < CowController
	inherit_resources
  
  respond_to :js, :only => [:create, :confirm]

	def index
    @schedules = Schedule.search(params, current_user.account_id).paginate(:page => params[:page])

    respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @schedules}
      end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if params[:commit] == 'Confirmar'
      @schedule.status = 2
    elsif params[:commit] == 'Cancelar'
      @schedule.status = 3
    end
    if params[:commit] == 'Atender' && @schedule.patient_id.nil?
      flash[:error] = "Identifique o paciente."
      redirect_to edit_schedule_path
      
    else
    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        if params[:commit] == 'Atender'
          format.html { redirect_to(new_patient_treatment_path(:patient_id => @schedule.patient_id, :schedule_id => @schedule.id)) }
        else
          format.html { redirect_to(calendar_schedules_path) }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => schedule.errors, :status => :unprocessable_entity }
      end
    end
    end    
    #update!{calendar_schedules_path}
  end

  def calendar
    # full_calendar will hit the index method with query parameters
    # 'start' and 'end' in order to filter the results for the
    # appropriate month/week/day. It should be possiblt to change
    # this to be starts_at and ends_at to match rails conventions.
    # I'll eventually do that to make the demo a little cleaner.
    @schedule = Schedule.new
    @events = Schedule.search(params, current_user.account_id)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events }
      format.js { render :json => @events }
    end
  end

  def confirm
    schedule = Schedule.find(params[:id])
    schedule.update_attributes(params[:schedule]) 
    schedule.status = 2
    schedule.save
    respond_to do |format|
      format.html { redirect_to(calendar_schedules_path) }
      format.js
    end
  end

  def cancel
    schedule = Schedule.find(params[:id])
    schedule.status = 3
    schedule.save
    respond_to do |format|
      format.js
    end
  end

end
