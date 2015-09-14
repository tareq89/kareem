class CreateTransactionProductLists < ActiveRecord::Migration
  def change
    create_table :transaction_product_lists do |t|
      t.integer :product_id
      t.integer :total_unit

      t.timestamps null: false
    end
  end
end
