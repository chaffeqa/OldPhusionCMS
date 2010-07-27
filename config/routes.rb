PhusionCMS::Application.routes.draw do |map|

  resources :nodes
  root :to => 'nodes#index'

  resources :text_elems, :except => [:index, :show]

  # Elements resources
  match ':shortcut/:position/new_element' => 'templates#new_element', :as => :new_element

  # shortcut usage
  match ':shortcut' => 'templates#show', :as => :shortcut
  match 'admin/:shortcut' => 'templates#edit', :as => :admin_shortcut
end
