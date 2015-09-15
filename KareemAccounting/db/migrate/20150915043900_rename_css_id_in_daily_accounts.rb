class RenameCssIdInDailyAccounts < ActiveRecord::Migration
  def self.up
  		rename_column :daily_accounts, :css_id, :css_class
  end

  def self.down
  	
  end
end
