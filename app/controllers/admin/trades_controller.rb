class Admin::TradesController < AdminAreaController 
  #before_filter :require_no_user,  :only => [:new, :create] 
  before_filter :require_user,  :only => [:show, :edit, :update, :new, :create] 
  layout 'admin'
  
  def index
    @trades = Trade.find(:all)
    @trade = Trade.new 
  end
  
  def new 
    @trade = Trade.new 
  end 
  
  def create 
    @trade = Trade.new(params[:trade]) 
    if @trade.save 
      flash[:notice] = "The trade has been created." 
      redirect_to admin_trades_url 
    else 
     # flash[:notice] = "There was a problem creating the seller." 
      redirect_to admin_trades_url      
    end 
  end 
  
  def show 
    @trade = Trade.find(params[:id])
  end 
  
  def edit 
    @trade = Trade.find(params[:id])
  end 
  
  def update 
    @trade = Trade.find(params[:id]) # makes our views "cleaner" and more consistent 
    if @trade.update_attributes(params[:trade])
      flash[:notice] = "Trade updated!" 
      redirect_to admin_trades_url 
    else 
      render :action => :edit 
    end 
  end
  
  def delete
    @trade = Trade.find(params[:id]) # makes our views "cleaner" and more consistent 
    if (@trade.destroy) 
      flash[:notice] = "Trade deleted!" 
      redirect_to admin_trades_url 
    else 
      render :action => :index 
    end 
  end
end