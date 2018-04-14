Rails.application.routes.draw do
  get 'sessions/new'

  get '/' => 'home#home'
  get '/mypage' => 'mypage#mypage'
  get '/search' => 'search#search'
  post '/search' => 'search#search'
  post '/search/detail' => 'search#detail'
  get '/library' => 'library#library'
  post '/library' => 'library#library'

  get '/login' => 'home#new'
  post '/login' => 'home#create'
  delete '/logout' => 'home#destroy'

  resource :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
