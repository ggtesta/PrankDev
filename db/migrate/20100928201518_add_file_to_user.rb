class AddFileToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :file_file_name, :string # Original filename
    add_column :users, :file_content_type, :string # Mime type
    add_column :users, :file_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :users, :file_name
    remove_column :users, :content_type
    remove_column :users, :file_size
  end
end
