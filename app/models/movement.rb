class Movement < ActiveRecord::Base
  validates :customer, :amount, :description, :mtype, :presence => true
  
  belongs_to :customer
  
  TYPES = %w(Deposit Withdrawal Investments) 
  # Class Methods
  #########################################

  def self.types_to_select_option_collection
    TYPES.map{|r| [r.titleize, r]}
  end 
end
