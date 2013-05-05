Ysawacom::Application.routes.draw do
  resources :articles do
    collection do
      get 'page/:page', action: :index
    end

    member do
      get :preview
    end
  end

  devise_for :users,
    controllers: { sessions: "devise_sessions" }

  root to: "home#index"
end
