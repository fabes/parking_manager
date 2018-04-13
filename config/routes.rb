Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :parking do 
    collection do 
      get 'overall-spaces-status'
      get 'find-parking-spot'
    end 
    get 'for-floor-level', on: :member
  end
end
