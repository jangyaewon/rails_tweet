Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  get '/home/index' => 'home#index'  #/home/index을 받으면 home콘트롤러의 index로 가라
#  post'/home/index' => 'home#create'
  root 'home#index'
#  get '/lotto' => 'home#lotto'
  get '/lunch' => 'home#lunch'
  
  get '/users' => 'user#index'
  get '/user/new' => 'user#new'
  get '/user/:id' => 'user#show' #:id의 위치에 아무것이나 들어가도 되다보니 new를 넣어도 에러가 날 수 있으니 위치가 중요하다.
  post '/user/create' => 'user#create'
  
  get 'lotto' => 'lotto#index'
  get 'lotto/new' => 'lotto#new'
  
  get 'lotto2' => 'lotto2#index'
  get 'lotto2/new' => 'lotto2#new'

end

