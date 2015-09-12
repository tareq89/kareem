module DailyAccountsHelper
	def account_type_options
    	[["সব একাউন্ট","সব একাউন্ট"],["আয়", "আয়"],["ব্যয়", "ব্যয়"],["ধার দিয়েছি ", "ধার দিয়েছি "],["ধার পরিশোধ হয়েছে", "ধার পরিশোধ হয়েছে"],["ঋণ নিয়েছি", "ঋণ নিয়েছি"],["ঋণ পরিশোধ হয়েছে", "ঋণ পরিশোধ হয়েছে"],["অন্যান্য","অন্যান্য"]]
    end

    def account_type_options_select
    	[{key:"সব একাউন্ট",value:"all"},{key:"আয়",value:"income"},{key:"ব্যয়",value:"spent"},{key:"ধার দিয়েছি",value:"loan_given"},{key:"ধার পরিশোধ হয়েছে",value:"loan_paid"},{key:"ঋণ নিয়েছি",value:"loan_taken"},{key:"ঋণ পরিশোধ হয়েছে",value:"loan_repaid"},{key:"অন্যান্য", value:"others"}]
    end

    def account_type_tr_class(kind)
	    attr_class = "other"
		account_type_options_select.each do |item|    			
			if item[:key] == kind
				attr_class =  item[:value]
	            break
			end
		end
	    return attr_class
	end
end
