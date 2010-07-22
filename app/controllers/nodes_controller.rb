class NodesController < ApplicationController
  before_filter :get_home_node
  before_filter :home_form?, :only => [:new, :edit, :create, :update]
  # GET /nodes
  # GET /nodes.xml
  def index
    @nodes = Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.xml
  def show
    @node = Node.find(params[:id]) if params[:id]
    redirect_to shortcut_path(@node.shortcut)
  rescue URI::InvalidURIError:
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.xml
  def new
    @node = Node.new(:displayed => true)
    @node.template = Template.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @node = Node.find(params[:id])
    @node.template = Template.new unless @node.template
  end

  # POST /nodes
  # POST /nodes.xml
  def create
    @node = Node.new(params[:node])
  
    respond_to do |format|
      if @node.save
        format.html { redirect_to(@node, :notice => 'Node was successfully created.') }
        format.xml  { render :xml => @node, :status => :created, :location => @node }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nodes/1
  # PUT /nodes/1.xml
  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to(@node, :notice => 'Node was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.xml
  def destroy
    @node = Node.find(params[:id])
    @node.destroy

    respond_to do |format|
      format.html { redirect_to(nodes_url) }
      format.xml  { head :ok }
    end
  end

  
  def home_form?
    @home_form = 'false'
    @home_form = 'true' if @home_node.id == params[:id]
  end
end


