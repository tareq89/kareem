class ChangeInColumnTypeInDaiilyAccount < ActiveRecord::Migration
  def up
  	change_table :daily_accounts do |t|
  		t.change :css_id, :string
  	end
  end

  def down
  	
  end
end
