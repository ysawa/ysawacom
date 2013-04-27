Ysawacom::Application.routes.draw do
  resources :articles

  devise_for :users,
    controllers: { sessions: "devise_sessions" }

  root to: "home#index"
end
