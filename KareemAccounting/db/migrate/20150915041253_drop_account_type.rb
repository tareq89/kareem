class DropAccountType < ActiveRecord::Migration
  def up
  	drop_table :account_types
  end

  def down
  	create_table :account_types do |t|
      t.string :key
      t.string :value

      t.timestamps null: false
    end  	
  end
end
