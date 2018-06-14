class LottoController < ApplicationController
    
    def index
        @lotto = Lotto.last
        @lottos = Lotto.all
    end
    
    def new 
        lnum = (1..45).to_a.sample(6).sort.to_s
        l1 = Lotto.new
        l1.numbers = lnum
        l1.save
        redirect_to "/lotto"
    end
    
end


