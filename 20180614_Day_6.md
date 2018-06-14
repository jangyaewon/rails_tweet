## Controller

- 역할 : 

  - 서비스 로직을 가지고 있다.

- 그동안 `app.rb`에서 작성했던 모든 내용이 `Controller` 에 들어감

- `Controller`는 하나의 서비스에 대해서만 관련한다.

  - 예를 들어 게시판의 기능 콘트롤러는 게시판 콘트롤러
  - 업데이트를 담당할 때는 업데이트 콘트롤러로 묶는 식

- `Controller`를 만들 때에는 `$rails g controller 콘트롤러명`을 이용한다.

  ```command
  $rails g controller home
  # app/controllers/home_controller.rb 파일 생성
  Running via Spring preloader in process 1221
        create  app/controllers/home_controller.rb
        invoke  erb
        create    app/views/home
        invoke  test_unit
        create    test/controllers/home_controller_test.rb
        invoke  helper
        create    app/helpers/home_helper.rb
        invoke    test_unit
        invoke  assets
        invoke    coffee
        create      app/assets/javascripts/home.coffee
        invoke    scss
        create      app/assets/stylesheets/home.scss
  ```

  

  app/controllers/home_controller.rb

```ruby
class HomeController < ApplicationController
    # 모든 코드는 ApplicationController를 상속받는 코드
end 

# 실행 코드 
#	$ rails s -b $IP -p $PORT
```

- `HomeController`를 만들면 app/views 하위에 콘트롤러 명과 일치하는 폴더가 생긴다.
- `HomeController`에서 액션(def)을 작성하면 해당 액션명과 일치하는 `view`파일을 app/views/home 폴더 밑에 작성한다.
- 사용자의 요청을 받는 url 설정은 config/routes.rb에서 한다.
  - 주소를 받는 역할은 routes.rb에서 다 한다.
    - get () do 형식으로 안 해도 된다.

```ruby
#Rails에는 Development, Test, Production환경(모드)가 있다.
#Development 환경에서는 병경사항이 자동적으로 확인되고, 모든 로그가 찍힌다.
#Production 환경에서는 변경사항도 자동적으로 저장되지 않고, 로그도 일부만. `rails s`로 실행하지 않는다.
```



### 간단도전과제

- 점심메뉴를 랜덤으로 보여준다.
- 글자 + 이미지가 출력된다.
- 점심메뉴를 저장하는 변수는 `Hash`타입으로 한다.
  - @lunch = {"점심메뉴 이름"=>"이미지 주소"}
  - `Hash`에서 모든 key값을 가져오는 메소드는 `.keys`이다.
- 요청은 `/lunch`로 받는다.



## Model

```ruby
#모델 생성-구조만(db/migrate에 20180614021020_create_users.rb 생성)
$ rails g model 모델명
Running via Spring preloader in process 3175
      invoke  active_record
      create    db/migrate/20180614021020_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/models/user_test.rb
      create      test/fixtures/users.yml

```

```ruby
# 실제 DB에 스키마 파일대로 적용하기
#db생성(db파일 밑에 sqlite, schema가 생긴다.)
$ rake db:migrate  
== 20180614021020 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 0.0017s
== 20180614021020 CreateUsers: migrated (0.0027s) =============================
    
# DB구조를 수정했을 경우 drop을 통해 DB를 날린다음 다시 migrate 한다.
$ rake db:drop  
Dropped database 'db/development.sqlite3'
Database 'db/test.sqlite3' does not exist

$ rake db:reset
# 데이터 베이스 구조는 유지하되 데이터는 다 날려라
```

- Rails는 ORM(Object Relation Mapper)을 기본적으로 장착하고 있음(Active Record)
- migrate 파일을 이용해서 DB의 구조를 잡아주고 명령어를 통해 실제 DB를 생성/변경한다.
- Model 파일을 이용해서 DB에 있는 자료를 조작.
  - 만들어진 데이터는 ApplicationRecord을 받은 user.rb에 저장된다.

```ruby
 $ rails c
Running via Spring preloader in process 3331
Loading development environment (Rails 5.0.7)
2.3.4 :001 > User.methods

# User 하나 생성
2.3.4 :002 > User.new
 => #<User id: nil, username: nil, password: nil, created_at: nil, updated_at: nil> 

# 빈 껍데기(테이블에거 row 한줄)를 만든다.
# User의 인스턴스 하나를 u1에 집어넣는다.
# 하나의 User가 생겼다.
2.3.4 :003 > u1 = User.new
 => #<User id: nil, username: nil, password: nil, created_at: nil, updated_at: nil> 

# 실제 DB에 반영(저장)
# u1을 저장한다.
2.3.4 :004 > u1.save
   (0.2ms)  begin transaction
  SQL (1.4ms)  INSERT INTO "users" ("created_at", "updated_at") VALUES (?, ?)  [["created_at", "2018-06-14 02:23:26.152735"], ["updated_at", "2018-06-14 02:23:26.152735"]]
   (11.0ms)  commit transaction
 => true 

# 자료 조작      
# 널값을 가지고 있으니 username,password에 제대로 된 값을 집어넣는다.
2.3.4 :007 > u1.username = "haha"
 => "haha" 
2.3.4 :008 > u1
 => #<User id: 1, username: "haha", password: nil, created_at: "2018-06-14 02:23:26", updated_at: "2018-06-14 02:23:26">   
2.3.4 :009 > u1.save
   (0.2ms)  begin transaction
  SQL (0.6ms)  UPDATE "users" SET "username" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["username", "haha"], ["updated_at", "2018-06-14 02:27:07.685913"], ["id", 1]]
   (13.5ms)  commit transaction
 => true       
  2.3.4 :010 > u1.password = "1234"
 => "1234" 
2.3.4 :011 > u1.save
   (0.2ms)  begin transaction
  SQL (0.5ms)  UPDATE "users" SET "password" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["password", "1234"], ["updated_at", "2018-06-14 02:27:53.346493"], ["id", 1]]
   (12.3ms)  commit transaction
 => true            
```

등록된 라우트들을 보는 것

```ruby
$ rake routes
     Prefix Verb URI Pattern            Controller#Action
       root GET  /                      home#index
      lotto GET  /lotto(.:format)       home#lotto
      lunch GET  /lunch(.:format)       home#lunch
      users GET  /users(.:format)       user#index
            GET  /user/:id(.:format)    user#show
  users_new GET  /users/new(.:format)   user#new
user_create POST /user/create(.:format) user#create
```

 

## 간단과제

- 그동안에 뽑혔던 내역을 저장해주는 로또번호 추천기
- `/lotto`  => 새로 추천받은 번호를 출력
  -  `a`태그를 이용해서 새로운 번호를 발급
  -  새로발급된 번호가 가장 마지막과 최상단에 뜬다.
  -  최상단의 메세지는 `이번주 로또번호는 [...] 입니다`
- `/lotto/new` => 신규 번호를 발급, 저장 후 `/lotto`로 리디렉션
- 모델명 : Lotto
- 콘트롤러명 : LottoController