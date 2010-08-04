PhusionCMS::Application.routes.draw do |map|
  

  
  root :to => 'nodes#index'
  resources :nodes
  
  #  scope ':shortcut' do
  resources :link_list_elems, :except => [:index, :destroy] do
    resources :links, :except => [:index, :show, :destroy] do
      post :file, :on => :member
    end
  end
  resources :text_elems, :except => [:index, :destroy]
  resources :elements, :only => [:destroy] do
    get :move, :on => :member
  end
  resources :blog_elems, :except => [:index, :destroy]
  resources :photo_gallery_elems, :except => [:index, :destroy] do
    resources :photos, :except => [:index, :show]
  end
  match '/calendar_elems(/:year(/:month))' => 'calendar_elems#index', :as => :calendar_elems, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  #  end

  # Elements resources
  match ':shortcut/:position/new_element' => 'templates#new_element', :as => :new_element

  # shortcut usage
  match ':shortcut' => 'templates#show', :as => :shortcut
  match 'admin/:shortcut' => 'templates#edit', :as => :admin_shortcut
end
