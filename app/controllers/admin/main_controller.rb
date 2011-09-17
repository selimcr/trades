class Admin::MainController < AdminAreaController  
  layout 'admin_login'
  def servicios
    if params[:serviceTab]
      render :inline => "<p><h2>" + params[:serviceTab] + "</h2></p><p>Esta es la información completa de este servicio!!!</p>"
    end
  end
  
  def index
    logger.info("INDEX EN MAIN ADMIN!!!")
  end
  
  def about    
  end
  
  def contact    
  end
  
  def location    
  end
  
  
end
