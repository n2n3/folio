class AdminController < ApplicationController
  before_filter :authorize, :except => [:login, :reset]

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        unless session[:imgs].nil?
          session[:imgs].each do |i|
            img = Img.find_by_id(i)
            img.by = user.id
            img.save
          end
          session[:imgs] = []
        end
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => 'index' })
      else
        flash.now[:notice] = "invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "logged out."
    redirect_to :controller => 'imgs'
  end

  def index
    @session_id = request.cookies["_folio_session"]
    @total_pictures = Img.count
  end

  private
  
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "please log in."
      session[:original_uri] = request.request_uri
      redirect_to :action => 'login'
    end
  end
end
