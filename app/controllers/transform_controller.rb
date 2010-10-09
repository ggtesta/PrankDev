# app/controllers/magic_controller.rb
class TransformController < ApplicationController
  
  
  # melhorar!
  def index
    @page = Page.find(params[:page_id])
    @rules = Rule.find_all_by_page_id(@page.id)
#   redirect_to("/pages/#{@page.user_id}#{@page.file_subpath}/#{@page.file.path.split('/').last}")
    complete_file_name = @page.file.path.split(@page.user_id.to_s)[1]
    
    file_name_without_extension = complete_file_name.split('.')[0]
    file_extension = complete_file_name.split('.')[1]
    
    redirect_to("/pages/#{@page.user_id}#{file_name_without_extension}2.#{file_extension}")
    
 #   file = File.open(@page.file.path)
 #   temp_string = ""
 #   file.each { |line| temp_string.concat(line.to_s) }
 #   file.close
 #   @current_context = Nokogiri::HTML::Document.new(temp_string)
  end
  
end
