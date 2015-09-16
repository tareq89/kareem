module DailyAccountsHelper
    
	def account_type_options(is_debit)		
    	account_types = []
    	DailyAccount.account_type_collection.each do |account|
            if account[:is_debit].to_s == is_debit
        		acc_type_twice_array = [account[:account_type], account[:account_type]]
        		account_types << acc_type_twice_array                
            else
	    		acc_type_twice_array = [account[:account_type], account[:account_type]]
	    		account_types << acc_type_twice_array                            	
            end

    	end
    	print account_types
    	return account_types    	 
    end
    


    def account_type_options_radio(is_debit)
    	account_types_option_select = []
    	DailyAccount.account_type_collection.each do |account|
            if account[:is_debit].to_s == is_debit
        		acc_type_twice_array = {account_type: account[:account_type],css_class: account[:css_class]}
        		account_types_option_select << acc_type_twice_array     
    		else
	    		acc_type_twice_array = {account_type: account[:account_type],css_class: account[:css_class]}
        		account_types_option_select << acc_type_twice_array
            end
    	end
    	return account_types_option_select     
    end
end
