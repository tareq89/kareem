module DailyAccountsHelper
    def account_type_collection
        [{account_type: "অন্যান্য", css_class: "other", is_debit: "all"},{account_type: "আয়", css_class: "income", is_debit: false},{account_type: "ব্যয়", css_class: "spent", is_debit: true},{account_type: "ধার নিয়েছে", css_class: "loan_given", is_debit: true},{account_type: "ধার পরিশোধ করেছে", css_class: "loan_paid", is_debit: false},{account_type: "ধার নিয়েছি", css_class: "loan_taken", is_debit: false},{account_type: "ধার পরিশোধ করেছি ", css_class: "loan_repaid", is_debit:   true}]
    end


   
	


	def account_type_options(is_debit)		
    	account_types = [["অন্যান্য", "other"]]
    	account_type_collection.each do |account|
            if account[:is_debit].to_s == is_debit
        		acc_type_twice_array = [account[:account_type], account[:css_class]]
        		account_types << acc_type_twice_array                
            elsif is_debit=="all"                        	            
	    		acc_type_twice_array = [account[:account_type], account[:css_class]]
	    		account_types << acc_type_twice_array                            	
            end

    	end
    	print account_types
    	return account_types
    	 
    end
    


    def account_type_options_select(is_debit)
    	account_types_option_select = [{account_type: "অন্যান্য", css_class: "other"}]
    	account_type_collection.each do |account|
            if account[:is_debit].to_s == is_debit
        		acc_type_twice_array = {account_type: account[:account_type],css_class: account[:css_class]}
        		account_types_option_select << acc_type_twice_array     
    		elsif is_debit=="all" || is_debit == nil                       	            
	    		acc_type_twice_array = {account_type: account[:account_type],css_class: account[:css_class]}
        		account_types_option_select << acc_type_twice_array
            end
    	end
    	return account_types_option_select     
    end
end
