class Page < ActiveRecord::Base
  has_many :rules

#  user_id = AdminController.find_current_user
  
# Paperclip TODO: mudar endereço do arquivo do usuário

  has_attached_file :file, :path => ":rails_root/public/pages/:user_id/:basename.:extension" 
  

#  def user_id
#    @user_id
#  end
  
  
end
