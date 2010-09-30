class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
          
      t.integer :rule_id, :options => "CONSTRAINT fk_page_rules REFERENCES rules(id)"
      t.text :source_code

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
