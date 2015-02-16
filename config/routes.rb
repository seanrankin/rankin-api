Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      root :to => "rankins#index"
      resources :rankins
    end
  end
end
