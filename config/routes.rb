Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'youtube#index'
  get "test" => "youtube#moriya"

end
