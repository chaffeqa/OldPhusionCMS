class NodesController < ApplicationController
  before_filter :home_node?, :except => [:index, :new, :create]
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
    @node = Node.find_last_by_shortcut(params[:shortcut]) if params[:shortcut]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.xml
  def new
    if params[:home] == "true"
      @node = Node.new(:menu_name => 'Home', :title => 'Home', :shortcut => 'home', :displayed => true)
      @home = true
    else
      get_home_node
      @node = Node.new(:displayed => true)
      @home = false
    end
    @template = @node.build_template
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @node = Node.find(params[:id])
    @template = @node.template
  end

  # POST /nodes
  # POST /nodes.xml
  def create
    @node = Node.new(params[:node])
    @template = @node.build_template(params[:template])

    respond_to do |format|
      if @node.save
        format.html { redirect_to(@node, :notice => 'Node was successfully created.') }
        format.xml  { render :xml => @node, :status => :created, :location => @node }
      else
        if home_node?
          @home = true
        end
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
end


