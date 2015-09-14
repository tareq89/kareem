class CreateCompanyAccounts < ActiveRecord::Migration
  def change
    create_table :company_accounts do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.boolean :buyer
      t.boolean :seller

      t.timestamps null: false
    end
  end
end
