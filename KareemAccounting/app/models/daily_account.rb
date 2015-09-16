class DailyAccount < ActiveRecord::Base	
	validates :amount, :presence => true
	before_save { self.date = Date.today }
	before_save :set_css_class_and_is_debit
	before_update :set_css_class_and_is_debit
	

	def DailyAccount.total_amount(daily_accounts=nil)
		if daily_accounts==nil
			daily_accounts = DailyAccount.all			
		end
		@amount = 0
		daily_accounts.each { |daily_account| @amount += daily_account.amount }
		return @amount		
	end


	def DailyAccount.account_type_collection
        [{account_type: "অন্যান্য", css_class: "other", is_debit: nil},{account_type: "আয়", css_class: "income", is_debit: false},{account_type: "ব্যয়", css_class: "spent", is_debit: true},{account_type: "ধার নিয়েছে", css_class: "loan_given", is_debit: true},{account_type: "ধার পরিশোধ করেছে", css_class: "loan_paid", is_debit: false},{account_type: "ধার নিয়েছি", css_class: "loan_taken", is_debit: false},{account_type: "ধার পরিশোধ করেছি ", css_class: "loan_repaid", is_debit:   true},{account_type: nil, css_class: nil, is_debit:   nil}]
    end

    def set_css_class_and_is_debit
    	DailyAccount.account_type_collection.each do |account_type|
    		if account_type[:account_type] == self.account_type
    			self.css_class = account_type[:css_class]
    			self.is_debit = account_type[:is_debit]
    			break
    		end
    	end
    end

    def concat_css_class_and_is_debit
    	css_class = "#{self.css_class} #{self.is_debit}"
    	print "this is ***************************************************** #{css_class} \n"
    	return css_class
    end
end
