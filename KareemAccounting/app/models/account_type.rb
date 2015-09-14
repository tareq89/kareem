class AccountType < ActiveRecord::Base
    has_many :daily_account, dependent: :destroy
	
end
