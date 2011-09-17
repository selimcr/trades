class Trade < ActiveRecord::Base  
  belongs_to :master
  
  validates_numericality_of :long_t, :short_t, :fillBuy, :fillSell, :exRt, :counterCurrBuy, :counterCurrSell, :result, :message=>" should be a number."
  
end
