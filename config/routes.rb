Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "youtube#index"
  get "/UCb9h8EpBlGHv9Z896fu4yeQ" => "youtube#manabu"
  get 'search' => 'youtube#search'

end
