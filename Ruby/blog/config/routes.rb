Blog::Application.routes.draw do
  get "welcome/index"

  root :to => "welcome#index"
  resources :posts do
    resources :comments
  end

end
