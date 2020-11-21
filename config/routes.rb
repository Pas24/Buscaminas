Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create, :update]
  resources :game_tables, only: [:index, :show, :create, :update]
  get '/game/tables/:game_id', to: 'game_tables#show_game'
end