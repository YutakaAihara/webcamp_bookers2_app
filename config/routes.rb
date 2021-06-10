Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  scope :home do
    get 'about' => 'homes#about'
  end

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  get 'search' => 'search#search'

  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
    resources :group_users, only: [:create, :destroy]
    resources :group_messages, only: [:new, :create, :show]
  end
end