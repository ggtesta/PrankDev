class RulesController < ApplicationController

  # GET /rules
  def index
    @rules = Rule.find_all_by_page_id(params[:page_id])
    @page = Page.find(params[:page_id])
  end

  # GET /rules/1
  def show
    @rule = Rule.find(params[:id])
    @page = @rule.page.id
  end

  # GET /rules/new
  def new
    @rule = Rule.new
    @page = Page.find(params[:page_id])
  end

  # GET /rules/1/edit
  def edit
    @rule = Rule.find(params[:id])
    @page = @rule.page.id
 #   redirect_to(:controller => :transform, :action => :index, :page_id => @rule.page_id )
  end

  # POST /rules
  def create
    @rule = Rule.new(params[:rule])

   
    if @rule.save
      flash[:notice] = "Regra com seletor '#{@rule.css_selector}' criada com sucesso."
      redirect_to(:controller => :transform, :action => :index, :page_id => @rule.page_id, 
        :adress => "rules/new?page_id=#{@rule.page_id}" )
    else
      render :action => "new"
    end
  end

  # PUT /rules/1
  def update
    @rule = Rule.find(params[:id])
    @page = @rule.page.id
    
    if @rule.update_attributes(params[:rule])
      flash[:notice] = "A regra com seletor '#{@rule.css_selector}' foi atualizada com sucesso."
      redirect_to(:controller => :transform, :action => :index, :page_id => @rule.page_id,
      :adress => "rules?page_id=#{@rule.page_id}" )
 #     redirect_to(@rule, :notice => 'A regra foi atualizada com sucesso.')
    else
      redirect_to(@rule, :action => "edit", :notice => 'Não foi possível atualizar a regra, por favor, tente outra vez.')
    end
    
  end


  # DELETE /rules/1
  def destroy
    @rule = Rule.find(params[:id])
    page_id = @rule.page.id
    @rule.destroy
    flash[:notice] = "A regra selecionada foi excluída."
    redirect_to(:controller => :transform, :action => :index, :page_id => @rule.page_id,
      :adress => "rules?page_id=#{@rule.page_id}" ) 
#    redirect_to(rules_url(:page_id => page_id.to_s )) 
  end
  
end
