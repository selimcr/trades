class Admin::MovementsController < AdminAreaController  
  before_filter :require_user,  :only => [:show, :edit, :update, :new, :create] 
  layout 'admin_customers'
  
  def index
    if params[:id]
      @customer = Customer.find(params[:id])           
    end
    @customers = Customer.find(:all)
  end
  
  def search
    if params[:customer][:id]
      @customer = Customer.find(params[:customer][:id])           
      @customers = Customer.find(:all)
      render :action => :index
    else
      @customers = Customer.find(:all)
      render :action => :index
    end    
  end
  
  def new
    @movement = Movement.new    
    @customers = Customer.find(:all)
  end
  
  def create 
    @movement = Movement.new(params[:movement])
    @movement.customer = Customer.find(params[:customer][:id]) unless params[:customer][:id].blank?
    if @movement.save 
      case @movement.mtype
        when 1
            @movement.customer.initial_capital = @movement.customer.initial_capital + @movement.amount - 150;	 
            @movement.customer.actual_capital = @movement.customer.actual_capital + @movement.amount - 150;	 

        when 2
            @movement.customer.initial_capital = @movement.customer.initial_capital - @movement.amount + 150;                 
            @movement.customer.actual_capital = @movement.customer.actual_capital - @movement.amount + 150;	 
      end
      if @movement.customer.save
        flash[:notice] = "The movement has been created." 
        redirect_to admin_movements_url 
      else
        flash[:notice] = "The movement can't be updated in the customer account." 
        redirect_to admin_movements_url 
      end
    else 
      @customers = Customer.find(:all)
      flash[:notice] = "There was a problem creating the movement." 
      render :action => :new 
    end 
  end 
  
  def edit 
    @movement = Movement.find(params[:id])
  end 
  
  def update 
    @movement = Movement.find(params[:id]) # makes our views "cleaner" and more consistent    
    if @movement.update_attributes(params[:movement])  
      flash[:notice] = "Movement updated!" 
      redirect_to admin_movements_url
    else 
      render :action => :edit 
    end
  end
  
  def delete
    @movement = Movement.find(params[:id]) # makes our views "cleaner" and more consistent     
    if (@movement.destroy) 
      flash[:notice] = "Movement deleted!" 
      redirect_to admin_movements_url 
    else 
      render :action => :index 
    end   
  end  
end