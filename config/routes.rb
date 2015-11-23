Rails.application.routes.draw do


	# Gestion des erreurs
  get 'not_found' => 'error#not_found'

  get 'server_error' => 'error#server_error'


  #get 'representatives/dashboard'

	
	resources :representatives do
					collection do 
									devise_for :representatives do
										get '/representatives/sign_in' => 'devise/sessions#new'
										delete '/representatives/sign_out' => 'devise/sessions#destroy'
									end
					end
					member do 
						get 'dashboard' => 'representatives#dashboard'
					end
	end

	#get 'availability' =>  'counselors#advisor_availability'
	#post 'register_availability' => 'counselors#register_advisor_availability'


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


  resources :contacts, only: [:new, :create]

  root to: 'home#main'
  get 'home/main'
  get 'home/connexion'
  
	# Route pour tester connexion au chat
  # get 'home/test'

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
