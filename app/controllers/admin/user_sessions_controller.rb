class Admin::UserSessionsController < ApplicationController 
  before_filter :require_no_user,   :only => [:new, :create] 
  before_filter :require_user,  :only => :destroy 
  layout 'admin'
  
  def new 
    @user_session = UserSession.new 
  end 
  
  def create 
    @user_session = UserSession.new(params[:user_session]) 
    if @user_session.save 
      flash[:notice] = "Login successful!" 
      #redirect_back_or_default account_url(@current_user) 
      redirect_back_or_default admin_url(@current_user) 
    else 
      render :action => :new 
    end
  end 
  
  def destroy 
    current_user_session.destroy 
    flash[:notice] = "Logout successful!" 
    redirect_to admin_login_url
    #redirect_back_or_default new_admin_users_session_url 
  end 
end