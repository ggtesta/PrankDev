class AddAttributes < ActiveRecord::Migration
  def self.up
    add_column :rules, :attribute, :string
  end

  def self.down
    remove_column :rules, :attribute
  end
end
