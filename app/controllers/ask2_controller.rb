class Ask2Controller < ApplicationController
    def index
        @asks2 = Ask2.all
    end
    
    def show
        @ask2 = Ask2.find(params[:id])
    end 
    
    #서버로그의 사용자 request를 다 보여준다. 
    def new
        p request.ip
        p request.location.region
    end 
    
    def create
        a1 = Ask2.new
        a1.question=params[:question]
        a1.ip_address = request.ip
        a1.region = request.location.region
        a1.save
        redirect_to "/ask2"
    end
    
    def delete
        ask = Ask2.find(params[:id]) # 해당 id를 가진 데이터를 찾아낸다.
        ask.destroy # 그 데이터를 삭제한다.
        redirect_to "/ask2"
        
        # 수정
        # ask.question="다른 내용"
        # ask.save
    end    
    
    def edit
        @ask2 = Ask2.find(params[:id])
    end
    
    def update
        ask = Ask2.find(params[:id])
        ask.question = params[:question]
        ask.save
        redirect_to '/ask2'
    end 
    
end
