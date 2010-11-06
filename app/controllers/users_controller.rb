class UsersController < ApplicationController

  skip_before_filter :authorize, :only => [:new, :create]

  # GET /users
  def index
    @users = User.find(:all, :order => :username)
  end

  # GET /users/1
  def show
    @user = User.find(session[:user_id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Usuário #{@user.username} foi criado com sucesso."
      user = User.authenticate(@user.username, @user.password)
        
      session[:user_id] = user.id  
      redirect_to( :controller => 'pages', :action => 'index' )     
    end
    
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = "Usuário #{@user.username} atualizado com sucesso."
      redirect_to :action => 'show'
    else
      flash[:notice] = "Não foi possível atualizar usuário #{@user.username}. Tente de novo."
      redirect_to :action => 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end



