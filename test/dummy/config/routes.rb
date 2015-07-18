Rails.application.routes.draw do

  mount FeatureConfigEngine::Engine => "/fce"
end
