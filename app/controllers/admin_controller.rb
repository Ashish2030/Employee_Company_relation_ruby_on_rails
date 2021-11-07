class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username]=="admin" && params[:password]=="admin"
        session[:admin]="admin"
        redirect_to :controller => "companies"
      else
        flash[:notice]="Invalid credentials"
        render :action => :login
      end
    end
  end
  def logout
    session[:admin]=nil
    flash[:notice]="You are logged Out"
    redirect_to :action => :login
  end
end
