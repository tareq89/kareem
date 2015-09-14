class AddFromWhomToDailyAccount < ActiveRecord::Migration
  def change
    add_column :daily_accounts, :from_whom, :string
  end
end
