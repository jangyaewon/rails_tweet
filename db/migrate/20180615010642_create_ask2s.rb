class CreateAsk2s < ActiveRecord::Migration[5.0]
  def change
    create_table :ask2s do |t|
      
      t.text "question"
      t.string "ip_address"
      t.string "region"
      
      t.timestamps
    end
  end
end
