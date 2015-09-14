module DailyAccountsHelper
    


    def account_type_tr_class(account_type_id)
	    attr_class = "other"
	    print "this is : " + account_type_id.to_s
		AccountType.all.each do |item|    			
		    begin
		    	attr_class = AccountType.find(account_type_id).value
		    rescue Exception => e	
		    end		
		end
	    return attr_class
	end
	


	def account_type_options(is_debit)		
    	account_types = []
    	AccountType.all.each do |account_type|
            if account_type[:is_debit].to_s == is_debit
            	print "#{account_type[:is_debit].to_s}  :  #{is_debit} \n"
        		acc_type_twice_array = [account_type.key, account_type.id]
        		account_types << acc_type_twice_array                
            elsif is_debit=="all"                        	            
	    		acc_type_twice_array = [account_type.key, account_type.id]
	    		account_types << acc_type_twice_array                            	
            end

    	end
    	print account_types
    	return account_types
    	 
    end
    


    def account_type_options_select(is_debit)
    	account_types_option_select = []
    	AccountType.all.each do |account_type|
            if account_type[:is_debit].to_s == is_debit
        		acc_type_twice_array = {key: account_type.key,value: account_type.value}
        		account_types_option_select << acc_type_twice_array     
    		elsif is_debit=="all"                        	            
	    		acc_type_twice_array = {key: account_type.key,value: account_type.value}
        		account_types_option_select << acc_type_twice_array
            end
    	end
    	return account_types_option_select     
    end
end
