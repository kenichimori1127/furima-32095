Rails.application.routes.draw do
  devise_for :users
root to:'items#index' #itemsコントローラーのindexアクションへ呼び出す記述
end
