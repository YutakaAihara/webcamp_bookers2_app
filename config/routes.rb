Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/create'
  get 'groups/edit'
  get 'groups/show'
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
end