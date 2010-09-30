class AddAttributesValueInRules < ActiveRecord::Migration
  def self.up
    add_column :rules, :attr_value, :string
  end

  def self.down
    remove_column :rules, :attribute
  end
end
