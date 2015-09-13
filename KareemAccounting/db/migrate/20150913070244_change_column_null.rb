class ChangeColumnNull < ActiveRecord::Migration
  def change
  	change_column_null :daily_accounts, :amount, false
  end
end
