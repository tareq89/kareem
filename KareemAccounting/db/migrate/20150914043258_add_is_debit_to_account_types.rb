class AddIsDebitToAccountTypes < ActiveRecord::Migration
  def change
    add_column :account_types, :is_debit, :boolean
  end
end
