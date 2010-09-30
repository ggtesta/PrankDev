class AddColumnUserIdToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :user_id, :integer, :options => "CONSTRAINT fk_pages_users_id REFERENCES users(id)"
  end

  def self.down
  end
end
