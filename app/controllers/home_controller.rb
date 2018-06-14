class HomeController < ApplicationController
    
    def index#index.html 파일만 views/home/index.html.erb파일을 만들기만 한다면 
        #자동으로 index.html과 연결해줘 erb코드를 안 써도 된다.
        @msg = "나의 첫 레일즈 앱에 오신걸 환영합니다"
    end    
    
    def lotto
        @lotto = (1..45).to_a.sample(6)
    end    
    
    def lunch
        @menu = {"20층" => "http://pds.joins.com/news/component/htmlphoto_mmdata/201603/07/htm_20160307155149662221.jpg", 
        "순남시래기" => "http://cfile25.uf.tistory.com/image/235FF03455A3421504721F", 
        "양자강" => "https://modo-phinf.pstatic.net/20170520_247/1495247687721KCLaN_JPEG/mosa7mirdv.jpeg?type=w720", 
        "시골집" => "https://media-cdn.tripadvisor.com/media/photo-s/05/30/86/f6/caption.jpg"
        }
        
        @lunch = @menu.keys.sample
    end    
end
