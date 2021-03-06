Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show]
  resources :destinations, only: [:show]
  resources :posts, only: [:show, :create, :edit, :update, :new]

  patch "/posts/:id/like", to: "posts#like", as: "like"
end
