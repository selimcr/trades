class Customer < ActiveRecord::Base        
      validates :name, :code, :presence => true
      validates_numericality_of :initial_capital, :message=>" should be a number."      
      has_many :csassociations
      has_many :customers, :through => :csassociations   
      has_many :movements
end
