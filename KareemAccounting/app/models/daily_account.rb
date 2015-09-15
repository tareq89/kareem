class DailyAccount < ActiveRecord::Base	
	validates :amount, :presence => true
	before_save { self.date = Date.today }
	def DailyAccount.total_amount(daily_accounts=nil)
		if daily_accounts==nil
			daily_accounts = DailyAccount.all			
		end
		@amount = 0
		daily_accounts.each { |daily_account| @amount += daily_account.amount }
		return @amount		
	end
end
