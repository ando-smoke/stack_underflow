Rails.application.routes.draw do
  get '/' => 'home#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users, :only => [:new, :create, :show]

  resources :questions do
    resources :responses, :except => [:index, :show, :new]
  end
end
