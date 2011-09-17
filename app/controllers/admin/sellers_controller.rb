class Admin::SellersController < AdminAreaController 
  #before_filter :require_no_user,  :only => [:new, :create] 
  before_filter :require_user,  :only => [:show, :edit, :update, :new, :create] 
  layout 'admin_customers'
  
  def index
    @sellers = Seller.find(:all)
    @seller = Seller.new 
  end
  def new 
    @seller = Seller.new 
  end 
  
  def create 
    @seller = Seller.new(params[:seller]) # Saving without session maintenance to skip # auto-login which can't happen here because # the User has not yet been activated     
    if @seller.save 
      flash[:notice] = "The seller has been created." 
      redirect_to admin_sellers_url 
    else 
     # flash[:notice] = "There was a problem creating the seller." 
      redirect_to admin_sellers_url      
    end 
  end 
  
  def show 
    @seller = Seller.find(params[:id])
  end 
  
  def edit 
    @seller = Seller.find(params[:id])
  end 
  
  def update 
    @seller = Seller.find(params[:id]) # makes our views "cleaner" and more consistent 
    if @seller.update_attributes(params[:seller])       
      flash[:notice] = "Seller updated!" 
      redirect_to admin_sellers_url 
    else 
      render :action => :edit 
    end 
  end
  
  def delete
    @seller = Seller.find(params[:id]) # makes our views "cleaner" and more consistent 
    if (@seller.destroy) 
      flash[:notice] = "Seller deleted!" 
      redirect_to admin_sellers_url 
    else 
      render :action => :index 
    end 
  end
end