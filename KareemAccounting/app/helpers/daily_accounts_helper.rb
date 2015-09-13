module DailyAccountsHelper
    def account_type_tr_class(kind)
	    attr_class = "other"
		AccountType.account_type_options_select.each do |item|    			
			if item[:key] == kind
				attr_class =  item[:value]
	            break
			end
		end
	    return attr_class
	end
end
