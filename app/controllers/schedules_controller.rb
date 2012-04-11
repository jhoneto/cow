class SchedulesController < CowController
	inherit_resources

	def index
    @schedules = Schedule.search(params, current_user.account_id).paginate(:page => params[:page])

	respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @schedules}
    end
  end

end
