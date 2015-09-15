class AddIsDebitToDailyAccounts < ActiveRecord::Migration
  def change
  	add_column :daily_accounts, :is_debit, :Boolean
  end
end
