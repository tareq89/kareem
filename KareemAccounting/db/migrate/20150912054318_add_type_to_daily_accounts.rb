class AddTypeToDailyAccounts < ActiveRecord::Migration
  def change
    add_column :daily_accounts, :type, :string
  end
end
