module ApplicationHelper

  def editable_region
    
  end

  def include_file

  end

  def website_name

  end


  def page_title

  end


  def date

  end


  def root_menu

  end


  def section_menu

  end


  def global_menu
    
  end


  def breadcrumbs

  end


  def search

  end


  def url

  end


  def logo

  end


  def login_status

  end




  def display_menu_list()
    ret = "<ul><li>"
    ret += "#{@home_node.menu_name}"
    ret += "    #{link_to 'Show', node_path(@home_node.id)}"
    ret += "|#{link_to 'Edit', edit_node_path(@home_node.id)}"
    ret += "|#{link_to 'Destroy', node_path(@home_node.id), :confirm => 'Are you sure?', :method => :delete}"
    ret += "</li>"
    @home_node.nodes.each do |childnode|
      ret += "<li>"
      ret += "#{childnode.menu_name}"
      ret += "    #{link_to 'Show', node_path(childnode.id)}"
      ret += "|#{link_to 'Edit', edit_node_path(childnode.id)}"
      ret += "|#{link_to 'Destroy', node_path(childnode.id), :confirm => 'Are you sure?', :method => :delete}"
      ret += display_tree_recursive(childnode)
      ret += "</li>"
    end
    ret += "</ul>"
  end

  def display_tree_recursive(node)
    ret = ""
    unless node.nodes.empty?
      ret += "<ul>"
      node.nodes.each do |childnode|
        ret += "<li>"
        ret += "#{childnode.menu_name}"
        ret += "    #{link_to 'Show', node_path(childnode.id)}"
        ret += "|#{link_to 'Edit', edit_node_path(childnode.id)}"
        ret += "|#{link_to 'Destroy', node_path(childnode.id), :confirm => 'Are you sure?', :method => :delete}"
        ret += display_tree_recursive(childnode)
        ret += "</li>"
      end
      ret += "</ul>"
    end
    ret
  end

  def options_tree_recursive(node, addition)
    array = []
    node.nodes.each do |childnode|
      array << ["#{addition} #{childnode.menu_name}", "#{childnode.id}"]
      unless childnode.nodes.empty?
        array += options_tree_recursive(childnode, "#{addition}---")
      end
    end
    array
  end


end
