# app/controllers/magic_controller.rb
class TransformController < ApplicationController
  
  def index
    @page = Page.find(params[:page_id])
    @rules = Rule.find_all_by_page_id(@page.id)
    
 #   file = File.open(@page.file.path)
 #   temp_string = ""
 #   file.each { |line| temp_string.concat(line.to_s) }
 #   file.close
 #   @current_context = Nokogiri::HTML::Document.new(temp_string)
  end
  
end
