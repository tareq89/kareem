class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :key
      t.string :value

      t.timestamps null: false
    end
  end
end
