Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/new'=> 'posts#new', as: :new_post
  get 'posts/:id' => 'posts#show', as: :post
  get 'comments/:id' => 'comments#show', as: :comment

  post 'posts/' => 'posts#create', as: :create_post
  post 'posts/:id/comments' => 'comments#create', as: :create_comment
  patch 'posts/:id/positive_vote' => 'posts#positive_vote', as: :positive_vote
  patch 'posts/:id/negative_vote' => 'posts#negative_vote', as: :negative_vote

  delete 'posts/:id' => 'posts#delete'
  delete 'comments/:id' => 'comments#delete'


  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
