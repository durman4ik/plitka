Rails.application.routes.draw do

  get '', to: redirect("/#{I18n.locale}")

  scope "/:locale/", locale: /ru|by/ do

    root 'home#index'
    get 'o_nas'                   => 'home#o_nas'
    get 'dashboard/my_portfolio'  => 'dashboards#portfolio', as: :dashboard_portfolio
    get 'dashboard/articles'      => 'dashboards#articles', as: :dashboard_articles


    devise_for :admins, :skip => [:sessions]
    as :admin do
      get 'administrator'     => 'devise/sessions#new', :as => :new_admin_session
      post 'sign_in'          => 'devise/sessions#create', :as => :admin_session
      delete 'sign_out'       => 'devise/sessions#destroy', :as => :destroy_admin_session
    end

    get 'dashboard' => 'dashboards#index'
    resource :dashboards do
      resources :phones, only: [:create, :destroy]
      resources :services, only: [:create, :destroy]
      resources :advantages, only: [:create, :destroy]
    end

    resources :articles do
      resources :article_attachments
    end


    resources :albums, path: 'portfolio' do
      resources :images, only: [:create, :destroy]
    end
  end






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
