class AddFileToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :file_file_name, :string # Original filename
    add_column :pages, :file_content_type, :string # Mime type
    add_column :pages, :file_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :pages, :file_name
    remove_column :pages, :content_type
    remove_column :pages, :file_size
  end
end
