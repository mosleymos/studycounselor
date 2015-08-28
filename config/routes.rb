Rails.application.routes.draw do
  
  post 'messages/chat'

  resources :categories

  resources :questions

  resources :administrators do
    member do 
      get 'dashboard'
    end
    collection do
       devise_for :administrators
    end
  end
  
  resources :rankings

  resources :leads

  resources :cards

  resources :students
  
  resources :counselors do
    resources :appointments
    collection do
       devise_for :counselors
    end
    
    member do
      get 'profile'
      get 'cards'
    end
   
  end
  
  resources :tags

  resources :jobs

  resources :programs

  resources :schools do
    member do
      get 'programs'
      get 'program_edit'
    end
  end

  root to: 'home#main'
  get 'home/main'
  get 'home/connexion'
  get 'home/test'

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
