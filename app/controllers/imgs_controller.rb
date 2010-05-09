class ImgsController < ApplicationController
  # GET /imgs
  # GET /imgs.xml
  def index
    @imgs = Img.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imgs }
    end
  end

  # GET /imgs/1
  # GET /imgs/1.xml
  def show
    @img = Img.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @img }
    end
  end

  # GET /imgs/new
  # GET /imgs/new.xml
  def new
    @img = Img.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @img }
    end
  end

  # GET /imgs/1/edit
  def edit
    @img = Img.find(params[:id])
  end

  # POST /imgs
  # POST /imgs.xml
  def create
    @img = Img.new(params[:img])

    respond_to do |format|
      if @img.save
        format.html { redirect_to(@img, :notice => 'Img was successfully created.') }
        format.xml  { render :xml => @img, :status => :created, :location => @img }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @img.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imgs/1
  # PUT /imgs/1.xml
  def update
    @img = Img.find(params[:id])

    respond_to do |format|
      if @img.update_attributes(params[:img])
        format.html { redirect_to(@img, :notice => 'Img was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @img.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imgs/1
  # DELETE /imgs/1.xml
  def destroy
    @img = Img.find(params[:id])
    @img.destroy

    respond_to do |format|
      format.html { redirect_to(imgs_url) }
      format.xml  { head :ok }
    end
  end
end
