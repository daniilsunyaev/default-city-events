Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  resources :towns, only: [] do
    resources :events, only: :index, module: :towns
  end
end
