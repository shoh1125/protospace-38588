Rails.application.routes.draw do
  devise_for :users
 root to: "prototypes#index"
 resources :prototypes do
   resources :comments, only: :create 
 end
 resources :users, only: :show





 devise_scope :users do
  get '/users', to: redirect("/users/sign_up")
end

end
