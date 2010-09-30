class Rule < ActiveRecord::Base
  belongs_to :page
  
  OPTIONS = [
    [ "New Item in the List" ,"newItemList" ],  # deve ser removido
    [ "Clone Item",           "clone" ]
  ]

  # TODO: Completar lista
  STRUCTURAL_TAGS = [ "div", "ul", "li", "p" ] 
  
  FORMATTING_TAGS = [ "a", "b", "i", "s"]
  
  
#  validates_inclusion_of :option, :in => OPTIONS.map {|disp, value| value}
end
