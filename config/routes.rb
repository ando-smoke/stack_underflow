Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :questions do
    resources :responses, :except => [:index, :show, :new]
  end
end
