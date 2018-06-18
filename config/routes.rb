Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  resources :towns, only: [] do
    resources :events, only: :index, module: :towns
  end

  resources :events, only: :show
  resources :discussions, only: :show do
    resources :comments, only: :create, module: :discussions
  end
end
