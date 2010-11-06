# app/controllers/magic_controller.rb
class TransformController < ApplicationController
  
  
  # melhorar!
  def index
    @page = Page.find(params[:page_id])
    @rules = Rule.find_all_by_page_id(@page.id)
    @adress = params[:adress]
  
    base = @page.file.path.split(@page.user_id.to_s)[0] + @page.user_id.to_s
    
    
#    file_name = @page.file.path.split(@page.user_id.to_s)[1]  # /index.html
#    file_name_without_ext = file_name.split('.')[0]  # /index
#    file_extension = file_name.split('.')[1]         # html

#    File.delete(base + file_name_without_ext + '2.' + file_extension) if 
#      File.exists?(base + file_name_without_ext + '2.' + file_extension)
          
#    out = File.new(base + file_name_without_ext + '2.' + file_extension, "w+")
#    out.close
#
#   redirect_to("/users_files/#{@page.user_id}#{file_name_without_ext}2.#{file_extension}")
  end
  
    
  def red(path)
    redirect_to(path)
  end
  
end
