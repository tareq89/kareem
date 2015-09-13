class AccountType < ActiveRecord::Base
    has_many :daily_account, dependent: :destroy
	def AccountType.account_type_options
    	@account_types = []
    	AccountType.all.each do |account_type|
    		acc_type_twice_array = [account_type.key, account_type.key]
    		@account_types << acc_type_twice_array
    	end
    	return @account_types
    	# [["সব একাউন্ট","সব একাউন্ট"],["আয়", "আয়"],["ব্যয়", "ব্যয়"],["ধার দিয়েছি ", "ধার দিয়েছি "],["ধার পরিশোধ হয়েছে", "ধার পরিশোধ হয়েছে"],["ঋণ নিয়েছি", "ঋণ নিয়েছি"],["ঋণ পরিশোধ হয়েছে", "ঋণ পরিশোধ হয়েছে"],["অন্যান্য","অন্যান্য"]]
    end
    def AccountType.account_type_options_select
    	@account_types_option_select = []
    	AccountType.all.each do |account_type|
    		acc_type_twice_array = {key: account_type.key,value: account_type.value}
    		@account_types_option_select << acc_type_twice_array
    	end
    	return @account_types_option_select
    	# [{key:"সব একাউন্ট",value:"all"},{key:"আয়",value:"income"},{key:"ব্যয়",value:"spent"},{key:"ধার দিয়েছি",value:"loan_given"},{key:"ধার পরিশোধ হয়েছে",value:"loan_paid"},{key:"ঋণ নিয়েছি",value:"loan_taken"},{key:"ঋণ পরিশোধ হয়েছে",value:"loan_repaid"},{key:"অন্যান্য", value:"others"}]
    end
end
