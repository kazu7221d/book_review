Rails.application.routes.draw do
  get '/' => 'home#home'
  post '/login' => 'home#login'
  get '/mypage' => 'mypage#mypage'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
