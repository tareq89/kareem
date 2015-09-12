class RenameTypeToKindToDailyAccounts < ActiveRecord::Migration
  def change
    change_table :daily_accounts do |t|
      t.rename :type, :kind      
    end
  end
end
