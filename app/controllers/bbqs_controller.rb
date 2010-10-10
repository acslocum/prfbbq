class BbqsController < ApplicationController
  # GET /bbqs
  # GET /bbqs.xml
  def index
    @bbqs = Bbq.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bbqs }
    end
  end

  # GET /bbqs/1
  # GET /bbqs/1.xml
  def show
    @bbq = Bbq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bbq }
    end
  end

  # GET /bbqs/new
  # GET /bbqs/new.xml
  def new
    @bbq = Bbq.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bbq }
    end
  end

  # GET /bbqs/1/edit
  def edit
    @bbq = Bbq.find(params[:id])
  end

  # POST /bbqs
  # POST /bbqs.xml
  def create
    @bbq = Bbq.new(params[:bbq])

    respond_to do |format|
      if @bbq.save
        flash[:notice] = 'Bbq was successfully created.'
        format.html { redirect_to(@bbq) }
        format.xml  { render :xml => @bbq, :status => :created, :location => @bbq }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bbq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bbqs/1
  # PUT /bbqs/1.xml
  def update
    @bbq = Bbq.find(params[:id])

    respond_to do |format|
      if @bbq.update_attributes(params[:bbq])
        flash[:notice] = 'Bbq was successfully updated.'
        format.html { redirect_to(@bbq) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bbq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bbqs/1
  # DELETE /bbqs/1.xml
  def destroy
    @bbq = Bbq.find(params[:id])
    @bbq.destroy

    respond_to do |format|
      format.html { redirect_to(bbqs_url) }
      format.xml  { head :ok }
    end
  end
end
