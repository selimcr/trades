class Master < ActiveRecord::Base
  has_many :trades
  
  validates_numericality_of :result, :percentage, :fill1, :fill2, :message=>" should be a number."    
        
end
