Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, skip: [:destroy]
  devise_for :users, skip: [:registrations]

  namespace :admin do
    get '/', to: 'dashboard#index'
    get '/send_payroll', to: 'dashboard#send_payroll'
    put '/update_status', to: 'dashboard#update_status' 
    get '/stores/export-weekly', to: 'stores#export_week'
    resources :users do
      member do
        get :toggle_status
      end
    end
    resources :stores
    resources :services
  end
end
