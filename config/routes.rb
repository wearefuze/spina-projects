Spina::Engine.routes.draw do
  namespace :admin do
    resources :projects
  end
end
