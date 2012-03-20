class SessionsController < Clearance::SessionsController
  
  def url_after_create
    home_index_path
  end

  def create
    @user = authenticate(params)
    if @user.nil?
      redirect_to root_path
    else
      sign_in(@user) 
      session[:account_id] = @user.account_id
      redirect_back_or(url_after_create)
    end
  end

end
