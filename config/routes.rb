Spina::Engine.routes.draw do
  namespace :admin do
    resources :projects do
      put :sort, on: :collection
      put :categories_update, on: :collection
    end
    
    get "projects-categories", to: "projects#categories"
  end
end
