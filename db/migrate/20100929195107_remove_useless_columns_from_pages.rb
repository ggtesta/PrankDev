class RemoveUselessColumnsFromPages < ActiveRecord::Migration
  def self.up
    remove_column :pages, :rule_id
    remove_column :pages, :source_code
    
    add_column :rules, :page_id, :integer, :options => "CONSTRAINT fk_rules_pages_id REFERENCES pages(id)"
  end

  def self.down
  end
end
