class Admin::CustomersController < AdminAreaController 
  #before_filter :require_no_user,  :only => [:new, :create] 
  before_filter :require_user,  :only => [:show, :edit, :update, :new, :create] 
  layout 'admin_customers'
  
  def index
    @customers = Customer.find(:all)
  end
  def new 
    @customer = Customer.new 
    @sellers = Seller.find(:all)
  end 
  
  def create 
    @customer = Customer.new(params[:customer]) # Saving without session maintenance to skip # auto-login which can't happen here because # the User has not yet been activated     
    @customer.actual_capital = @customer.initial_capital
    @customer.initial_month_capital = @customer.initial_capital    
    if @customer.save 
      #insert movement
      @movement = Movement.new()
      @movement.customer = @customer
      @movement.amount = @customer.initial_capital
      @movement.description = "New Customer"
      @movement.mtype = 3
      @movement.created_at = @customer.date
      if @movement.save 
        if !params[:seller][:id].blank?
            #No existe la asociación, hay que crearla        
            @csassociation = Csassociation.new()        
            @csassociation.customer_id = @customer.id
            @csassociation.percentage = params[:comission]
            @csassociation.seller_id = params[:seller][:id] 
            if @csassociation.save
              flash[:notice] = "The customer has been created." 
              redirect_to admin_customers_url 
            else
              flash[:notice] = "The customer has been created but it fail to save the seller association." 
              redirect_to admin_customers_url 
            end  
        else #No se selecciono un seller
          flash[:notice] = "The customer has been created." 
          redirect_to admin_customers_url 
        end       
      else
        flash[:notice] = "The customer has been created but it fail to save the movement." 
        redirect_to admin_customers_url 
      end
      
    else 
      flash[:notice] = "There was a problem creating the customer." 
      render :action => :new 
    end 
  end 
  
  def show 
    @customer = Customer.find(params[:id])
  end 
  
  def edit 
    @customer = Customer.find(params[:id])
    @sellers = Seller.find(:all)
    @csassociation = Csassociation.find_by_customer_id(@customer)
  end 
  
  def update 
    @customer = Customer.find(params[:id]) # makes our views "cleaner" and more consistent    
    @old_actual_capital = @customer.actual_capital
    params[:month_initial_capital] = params[:initial_capital]
    @customer.initial_month_capital = @customer.initial_capital    
    if @customer.update_attributes(params[:customer])      
      #Save Movement if actual_capital is different
      if @old_actual_capital != @customer.actual_capital
        @movement = Movement.new()
        @movement.customer = @customer
        @movement.amount = (@customer.actual_capital - @old_actual_capital)
        @movement.description = "Edit Customer"
        @movement.mtype = 3
        if !@movement.save 
          flash[:notice] = "Has ocurred an error at save the movement, please try the update again." 
          render :action => :edit 
        end
      end
      
      @csassociation = Csassociation.find_by_customer_id(@customer)
      if !params[:seller][:id].blank?
        if @csassociation.nil? #No existe la asociación, hay que crearla        
          @csassociation = Csassociation.new()        
          @csassociation.customer_id = params[:id]
          @csassociation.percentage = params[:comission]
          @csassociation.seller_id = params[:seller][:id] 
          if @csassociation.save
            flash[:notice] = "Customer updated!" 
            redirect_to admin_customers_url 
          else
            render :action => :edit 
          end      
        else #Existe la asociación, hay que modificarla        
          if @csassociation.update_attributes(:percentage => params[:comission], :seller => Seller.find(params[:seller][:id]))
            flash[:notice] = "Customer updated!" 
            redirect_to admin_customers_url 
          else
            render :action => :edit 
          end      
        end
      else #No se selecciono un seller, hay que eliminar la asociación
        unless @csassociation.nil?
          if !(@csassociation.destroy) 
            flash[:notice] = "Customer deleted!" 
            render :action => :edit 
          else
            flash[:notice] = "Customer updated!" 
            redirect_to admin_customers_url
          end
        else
          flash[:notice] = "Customer updated!" 
          redirect_to admin_customers_url
        end
      end
    else 
      render :action => :edit 
    end 
  end
  
  def delete
    @customer = Customer.find(params[:id]) # makes our views "cleaner" and more consistent 
    @movement = Movement.new()
    @movement.customer = @customer
    @movement.amount = @customer.actual_capital
    @movement.description = "Delete Customer"
    @movement.mtype = 4
    if @movement.save 
      if (@customer.destroy) 
        flash[:notice] = "Customer deleted!" 
        redirect_to admin_customers_url 
      else 
        render :action => :index 
      end 
    else
      flash[:notice] = "The customer can'n be deleted without insert the movement!" 
      redirect_to admin_customers_url 
    end    
  end
end