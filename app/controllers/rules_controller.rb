class RulesController < ApplicationController

  # GET /rules
  def index
    @rules = Rule.find_all_by_page_id(params[:page_id])
    @page = Page.find(params[:page_id])
  end

  # GET /rules/1
  def show
    @rule = Rule.find(params[:id])
  end

  # GET /rules/new
  def new
    @rule = Rule.new
    @page = Page.find(params[:page_id])
  end

  # GET /rules/1/edit
  def edit
    @rule = Rule.find(params[:id])
  end

  # POST /rules
  def create
    @rule = Rule.new(params[:rule])
   
    if @rule.save
      flash[:notice] = "Regra com seletor '#{@rule.css_selector}' criada com sucesso."
      redirect_to(:action => 'new', :page_id => @rule.page_id )
    else
      render :action => "new"
    end
  end

  # PUT /rules/1
  def update
    @rule = Rule.find(params[:id])
    
    if @rule.update_attributes(params[:rule])
      redirect_to(@rule, :notice => 'Rule was successfully updated.')
    else
      redirect_to(@rule, :action => "edit", :notice => 'Cannot update rule, please try again.')
    end
    
  end


  # DELETE /rules/1
  def destroy
    @rule = Rule.find(params[:id])
    page_id = @rule.page.id
    @rule.destroy
    redirect_to(rules_url(:page_id => page_id.to_s )) 
  end
  
end
