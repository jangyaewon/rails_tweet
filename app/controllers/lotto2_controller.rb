class Lotto2Controller < ApplicationController
    def index
        @new_number = Lotto2.last
        @lottos2 = Lotto2.all
        
    end
    
    def new 
        number = (1..45).to_a.sample(6).sort.to_s
        lotto = Lotto2.new
        lotto.numbers = number
        lotto.save
        redirect_to '/lotto2'
    end    
end
