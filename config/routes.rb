Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  # aboutのURLのパスだけを1階層（home分)追加する。
  scope :home do
    get 'about' => 'homes#about'
  end

  # いらないルーティングは実行しないようにする。(今回new等はいらない)
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end