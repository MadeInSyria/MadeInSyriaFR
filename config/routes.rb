MadeInSyriaFR::Application.routes.draw do
  #Static pages
  root  'posts#index'
  match '/about',   to: 'static_pages#about',   via: 'get'

  #User related pages
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Session related pages
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  #Blogposts
  resources :posts
  match '/newpost',     to: 'posts#new',    via: 'get'
  match '/admin/posts', to: 'posts#admin',  via: 'get'
  match 'posts/:name',  to: 'post#show',    via: 'get'

  #Categories
  resources :categories
  match '/newcategory', to: 'categories#new', via: 'get'

  #Contact Form
  resources :contacts, only: [:new, :create]
  match '/contact', to: 'contacts#new', via: 'get'

  #Rss Feed
  match '/feed', to: 'posts#feed', :format => 'rss', via: 'get'

  #Image gallery
  resources :media

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
