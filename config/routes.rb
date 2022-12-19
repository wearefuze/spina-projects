Spina::Engine.routes.draw do
  namespace :admin do
    resources :projects do
      post :sort, on: :collection
    end
  end
end
