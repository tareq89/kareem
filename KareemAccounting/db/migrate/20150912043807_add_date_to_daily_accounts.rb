class AddDateToDailyAccounts < ActiveRecord::Migration
  def change
    add_column :daily_accounts, :date, :Date
  end
end
