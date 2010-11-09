class Page < ActiveRecord::Base
  has_many :rules
  attr_accessor :new_subpath
  
#  user_id = AdminController.find_current_user
  
# Paperclip TODO: mudar endereço do arquivo do usuário

  has_attached_file :file, :path => ":rails_root/public/users_files/:user_id:file_subpath/:basename.:extension" 
  

  

# 'password' is a virtual attribute
  def new_subpath
    @new_subpath
  end


#  def user_id
#    @user_id
#  end
  
  
end
