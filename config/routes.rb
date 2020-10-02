Spina::Engine.routes.draw do
  resources :projects

  namespace :admin do
    resources :projects do
      post :sort, on: :collection
    end
  end
end
