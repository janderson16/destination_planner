Rails.application.routes.draw do
  root 'destinations#index'
  resources :destinations

  namespace :api do
    namespace :v1 do
        get 'conditions', to: "conditions#show"
    end
  end

end
