module CustomersHelper
  
  def getseller(customer)
    @seller_id = ""
    unless customer.id.nil?
      @csassociation = Csassociation.find_by_customer_id(customer)    
      @seller_id = @csassociation.seller_id.to_s unless @csassociation.nil?
    end
    return @seller_id
  end
end
