class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:templates, :instructions]


  # GET /pages
  def index
    @pages = Page.find_all_by_user_id(session[:user_id])
    @directories = ["root"]
    @pages.each { |page| 

      new_path = page.file.path.split(page.user_id.to_s)[1]
      splits = new_path.split("/");
     
      (@directories << splits[1]) if (splits.size == 3 && !@directories.include?(splits[1]))
      (@directories << "#{splits[1]}/#{splits[2]}") if 
        (splits.size == 4 && !@directories.include?("#{splits[1]}/#{splits[2]}"))
      (@directories << "#{splits[1]}/#{splits[2]}/#{splits[3]}") if 
        (splits.size == 5 && !@directories.include?("#{splits[1]}/#{splits[2]}/#{splits[3]}"))
     
    }
    
    @directories
    @pages
    @user = User.find(session[:user_id])
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
   
    pieces = @page.file.path.split("/");
    pieces[pieces.size - 1] = "#{pieces.last.split(".")[0]}2.#{pieces.last.split(".")[1]}"
    @page.alias = ""
    
    pieces.each { |piece| @page.alias.concat(piece + "/") }
    @page.alias.chop!
    
    
    
    
    
    if @page.save
      if @page.file_content_type == "text/html" then
        file = File.open(@page.file.path)
        temp_string = ""  
        file.each { |line| temp_string.concat(line.to_s) }
        file.close  
        
        alt_file = File.new(@page.alias.split("PrankDev/")[1],"w")
        alt_file.puts(temp_string)
        alt_file.close
      end
    
      flash[:notice] = "O arquivo #{@page.file_file_name} foi criado com sucesso."
      redirect_to(:action => 'new') 
    else
      render :action => "new" 
    end
    
  end

  # DELETE /pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "O arquivo selecionado foi excluído."
    redirect_to(:action => 'index')
  end
  
  def reset
    @page = Page.find(params[:id])
    
    template = File.open(@page.alias.split("PrankDev/")[1])
    temp_string = ""  
    template.each { |line| temp_string.concat(line.to_s) }
    template.close  
    
    puts temp_string
    
    puts @page.file.path
    puts File.exists?(@page.file.path)
       
    File.delete(@page.file.path.split("PrankDev/")[1])
   
    file = File.new(@page.file.path.split("PrankDev/")[1],"w")
    file.puts(temp_string)
    file.close
    
    
    Rule.find_all_by_page_id(@page.id).each { |rule|
      rule.destroy
    }
    
    
    flash[:notice] = "Seu template foi atualizado com sucesso."
    redirect_to(:action => 'index')
  end
  
  def import
  
 #   Dir.entries("public/templates/abrasive").each { |e|
 #     if (e != '.') && (e != '..') then
      
 #       if File.directory?("public/templates/abrasive/#{e}") then
 #         Dir.entries("public/templates/abrasive/#{e}").each { |f|
 #           puts "public/templates/abrasive/#{e}/#{f}"
 #           page = Page.create(:file_subpath => e.to_s, :file => "public/templates/abrasive/#{e}/#{f}", :user_id => session[:user_id] )
 #         }
 #       else

 #         page = Page.create(:file_subpath =>"", :file => "public/templates/abrasive/#{e}", :user_id => session[:user_id] )
 #       end
 #       puts page

 #     end
 #   }

    
    
    
#    file = File.open("public/templates")
#    temp_string = ""
#    file.each { |line| temp_string.concat(line.to_s) }
##    file.close  
    
#    File.delete("app/templates/transform/index.html")
    
#    template = File.new("app/templates/transform/index.html","w")
#    template.puts(temp_string)
#    template.close
    
    
#    base = @page.file.path.split(@page.user_id.to_s)[0] + @page.user_id.to_s
#    file_name = @page.file.path.split(@page.user_id.to_s)[1]  # /index.html
##    file_name_without_ext = file_name.split('.')[0]  # /index
#    file_extension = file_name.split('.')[1]         # html#


    
    redirect_to(:action => 'index')
    
  end
  
  def templates
  end
  
end


