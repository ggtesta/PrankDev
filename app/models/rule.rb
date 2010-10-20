class Rule < ActiveRecord::Base
  belongs_to :page
  
  OPTIONS = [
    [ "Clone Item", "clone" ],
    [ "Image",      "image" ]
  ]

  # TODO: Completar lista
  STRUCTURAL_TAGS = [ "div", "ul", "li", "p", "table", "td", "tr", "spam" ] 
  
  FORMATTING_TAGS = [ "a", "b", "i", "s"]
  
  
#  validates_inclusion_of :option, :in => OPTIONS.map {|disp, value| value}
end
