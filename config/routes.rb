Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    resources :responses, :except => [:index, :show, :new]
  end
end
