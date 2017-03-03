
Rails.application.routes.draw do

  devise_for :users
  resources :tweets do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
     #do end でネスト
    end #tweets_controllerに対してのresourcesメソッド
 #users_controllerに対してのresourcesメソッド
    root 'tweets#index'
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end

#Prefix 「Prefix」はルーティングの名前を表しています。「Prefix」は設定を行わなくても、自動的に割り当てられますが、自ら設定することもできます。
#Verb  「Verb」はHTTPメソッドを表しています。右側に表示されているパスにどのHTTPメソッドでアクセスするかを示しています。
#URI Pattern 「URI Pattern」はルーティングのパスを表しています。このパスにアクセスされた際に、指定のコントローラとアクションで処理が行われます。
#Controller#Action 「Controller#Action」は指定したパスにアクセスした際に処理が行われるコントローラとアクションを表しています。#以前がコントローラ名、#以後がアクション名を示しています。