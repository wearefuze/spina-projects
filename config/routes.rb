Spina::Engine.routes.draw do
  namespace :admin do
    resources :projects do
      put :sort, on: :collection
    end
  end
end
