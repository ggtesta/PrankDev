class AdminController < ApplicationController

  def login
    @user = User.new
    @menu = 1
    
    if request.post?
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:controller => "pages" , :action => "index" )
      else
        flash.now[:notice] = "Usuário ou senha inválido!"
      end
    end
  end


  def logout
    session[:user_id] = nil
    flash[:notice] = "Logout efetuado"
    redirect_to(:controller => "admin", :action => "login" )
  end

  def index
    @user = User.find(session[:user_id])
    @menu = 4
  end
  
end
