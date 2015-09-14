class CreateTransections < ActiveRecord::Migration
  def change
    create_table :transections do |t|
      t.string :transaction_no
      t.integer :company_account_id
      t.integer :transaction_type_id
      t.integer :transaction_product_list_id

      t.timestamps null: false
    end
  end
end
