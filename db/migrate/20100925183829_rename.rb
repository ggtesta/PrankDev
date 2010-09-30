class Rename < ActiveRecord::Migration
  def self.up
  
    rename_column :rules, :attribute, :option
    rename_column :rules, :attr_value, :value
    rename_column :rules, :new_text, :text
    
  end

  def self.down
    rename_column :rules, :option, :attribute
    rename_column :rules, :value, :attr_value
    rename_column :rules, :text, :new_text
  end
end
