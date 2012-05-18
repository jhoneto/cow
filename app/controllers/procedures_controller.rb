class ProceduresController < CowController
	inherit_resources
	
	autocomplete :procedure, :name, :extra_data => [:id, :price], :full => true

	def index
    @procedures = Procedure.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @procedures}
    end
  end
end
