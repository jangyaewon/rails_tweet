class UserController < ApplicationController
    def index
        @lottos = Lotto.all   #모든 User를 불러와라
    end
    
    def new
    end
    
    def create
        u1 = User.new
        u1.username=params[:username]
        u1.password=params[:password]
        u1.save
        redirect_to "/user/#{u1.id}"
    end
    
    def show
        @user = User.find(params[:id])
    end
    
end
