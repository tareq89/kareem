class CreateDailyAccounts < ActiveRecord::Migration
  def change
    create_table :daily_accounts do |t|
      t.string :category_spend
      t.integer :amount
      t.string :note
      t.string :to_whome      
      t.timestamps null: false
    end
  end
end
