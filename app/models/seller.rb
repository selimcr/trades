class Seller < ActiveRecord::Base 
  validates :name, :presence => true  
  validates_numericality_of :account, :message=>" should be a number."
    
  has_many :csassociations
  has_many :sellers, :through => :csassociations
end
