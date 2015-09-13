class ChangeColumnToNull < ActiveRecord::Migration
  def change
  	change_column_null :daily_accounts, :amount, true
  end
end
