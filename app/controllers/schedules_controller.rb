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
    update!{calendar_schedules_path}
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
    schedule.status = 2
    schedule.save
    respond_to do |format|
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
