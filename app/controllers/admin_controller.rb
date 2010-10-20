class AdminController < ApplicationController
  skip_before_filter :authorize, :only => [:instructions]

  def login
    @user = User.new
    
    if request.post?
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:controller => "pages" , :action => "index" )
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end


  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => "admin", :action => "login" )
  end

  def index
    @user = User.find(session[:user_id])
  end
  
  def instructions
  end
end
