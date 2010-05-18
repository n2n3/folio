class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.name} was successfully created."
        session[:user_id] = @user.id
        format.html { redirect_to(:controller => 'admin') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        unless session[:imgs].nil?
          session[:imgs].each do |i|
            img = Img.find_by_id(i)
            img.by = @user.id
            img.save
          end
          session[:img] = []
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(session[:user_id])

    respond_to do |format|
      if @user.update_attribute('password', params[:password])
        flash[:notice] = "User #{@user.name} was successfully updated."
        format.html { redirect_to :controller => 'admin' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html do
        redirect_to imgs_url
        session[:user_id] = nil
        flash[:notice] = "account deleted"
      end
      format.xml  { head :ok }
    end
  end
end
