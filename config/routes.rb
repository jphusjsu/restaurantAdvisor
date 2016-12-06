Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'

  resources :restaurants do
  	resources :reviews, except: [:index, :show]
    resources :complaints, except: [:index, :edit, :update] do
      collection do
        get 'all'
      end
    end
  	collection do
  		get 'search'
      get 'hidden'
  	end
    member do
      get 'hide'
      get 'display'
    end
  end

  resources :supports, except: [:index, :update] do
    collection do
      get 'all'
    end
  end

  match '/about_us', to: 'pages#about_us', via: :get
  match '/complaints', to: 'complaints#all_complaints', via: :get
end
