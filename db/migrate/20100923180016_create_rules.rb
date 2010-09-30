class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :css_selector
      t.text :new_text

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
