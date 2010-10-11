class PagesController < ApplicationController

  # GET /pages
  def index
    @pages = Page.find_all_by_user_id(session[:user_id])
#    @pages = Page.all
  end

  # GET /pages/1
  def show
    @page = Page.find(params[:id])
    @rules = Rule.all
  end

  # GET /pages/new
  def new
    @page = Page.new
 #  @page.user_id = session[:user_id].to_s
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = Page.new(params[:page])    
    @page.user_id = session[:user_id]
    
    
    if (@page.file_subpath.size > 1) && (@page.file_subpath[0] != '/') then
      @page.file_subpath = '/'.concat(@page.file_subpath)
    end
    
    if @page.file_subpath[@page.file_subpath.size-1] == '/' then
      @page.file_subpath.chop!
    end
    if (@page.file_subpath == '/') then @page.file_subpath = '' end
    
    if @page.save
      flash[:notice] = "The file #{@page.file.path.split('pages')[1]} was successfully uploaded."
      redirect_to(:action => 'new') 
    else
      render :action => "new" 
    end
    
  end

  # PUT /pages/1
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to(@page, :notice => 'Page was successfully updated.')
    else
        format.html { render :action => "edit" }
    end
    
  end

  # DELETE /pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "The file was succesfully deleted"
    redirect_to(:action => 'index')
  end
  
end


