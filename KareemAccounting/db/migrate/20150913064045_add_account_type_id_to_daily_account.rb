class AddAccountTypeIdToDailyAccount < ActiveRecord::Migration
  def change
    add_column :daily_accounts, :account_type_id, :int
  end
end
