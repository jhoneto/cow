class GroupsController < CowController
	inherit_resources

  def index
    @groups = Group.search(params, current_user.account_id).paginate(:page => params[:page])

	respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @groups}
    end
  end
end
