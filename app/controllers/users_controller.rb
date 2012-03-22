class UsersController < CowController
  inherit_resources

  def index
    @users = User.search(params, current_user.account_id).paginate(:page => params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users}
    end
  end
end