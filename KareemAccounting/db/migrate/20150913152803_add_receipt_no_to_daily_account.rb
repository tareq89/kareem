class AddReceiptNoToDailyAccount < ActiveRecord::Migration
  def change
    add_column :daily_accounts, :receipt_no, :string
  end
end
