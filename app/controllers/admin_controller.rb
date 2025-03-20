class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username]=="admin" && params[:password]=="admin"
          session[:admin]="admin"
          redirect_to admin_dashboard_index_url
      else
          flash[:notice]="Invalid username/password.Try again"
          render :action=>"login"
      end
    end
  end


  def logout

    session[:admin]=nil
    flash[:notice]="You are logged out"

    render :action =>:login
  end   
end
