class CreateLotto2s < ActiveRecord::Migration[5.0]
  def change
    create_table :lotto2s do |t|
      t.string "numbers"
      t.timestamps
    end
  end
end
