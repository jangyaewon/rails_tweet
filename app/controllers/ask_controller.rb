class AskController < ApplicationController
    def index
        a1 = Ask.new
        a1.question=params[:question]
        a1.save
        @asks = Ask.all
    end
    
    def new
        redirect_to 
    end    
end
