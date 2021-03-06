Rails.application.routes.draw do
  root 'albums#recent'
  resources :albums do
    member do
    delete :delete_upload
    end
  end
   get 'search', to: "albums#search"
   get "recent" => 'albums#recent'
   get "imgs" => 'albums#recentshow'

  get '/tagged', to: "albums#tagged", as: :tagged

  devise_for :users, controllers: { registrations: "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
