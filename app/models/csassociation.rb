class Csassociation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :seller
  
  set_primary_key :customer_id
end
