Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/new'=> 'posts#new', as: :new_post
  get 'posts/:id' => 'posts#show', as: :post
  post 'posts/' => 'posts#create', as: :create_post
  post 'posts/:id/comments' => 'comments#create', as: :create_comment
  patch 'posts/:id/positive_vote' => 'posts#positive_vote', as: :positive_vote
  patch 'posts/:id/negative_vote' => 'posts#negative_vote', as: :negative_vote

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
