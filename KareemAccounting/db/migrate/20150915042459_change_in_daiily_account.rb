class ChangeInDaiilyAccount < ActiveRecord::Migration
  def self.up
  		rename_column :daily_accounts, :kind, :account_type
  		rename_column :daily_accounts, :account_type_id, :css_id
  end

  def self.down
  	
  end
end
