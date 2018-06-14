class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      
      t.string "username"  #id는 이미 사용하고 있는 이름이라서 사용하면 안 된다.
      t.string "password"
      
      t.timestamps
    end
  end
end
