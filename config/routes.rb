PhusionCMS::Application.routes.draw do |map|
  resources :link_elems



  resources :nodes
  root :to => 'nodes#index'

  resources :text_elems, :except => [:index, :show]

  match ':shortcut/new_element/:position' => 'templates#new_element', :as => :new_element #, :method => :post
  match ':shortcut' => 'templates#show', :as => :shortcut
  match 'admin/:shortcut' => 'templates#edit', :as => :admin_shortcut
end
