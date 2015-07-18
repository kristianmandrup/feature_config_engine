FeatureConfigEngine::Engine.routes.draw do
  resources :features, except: [:edit, :new] do
    resources :filters, only: [:index, :update]

    collection do
      get :enabled
      get :disabled
      get :filters
    end
  end

  root to: 'features#index'
end
