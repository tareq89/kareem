class DailyAccountsController < ApplicationController	
	def index
		@can_add_new_entry = false
		@daily_accounts = []
		if params[:uniq_date] != nil
			@date = Date.parse(params[:uniq_date]).strftime("%A  %d %B %Y")
			@all_daily_accounts = DailyAccount.where(:date => params[:uniq_date])
			print "total number of dailyAccount : #{@all_daily_accounts.count}"
			@all_daily_accounts.each do |daily_account|
				begin
					is_debit = daily_account.is_debit
					if is_debit.to_s == params[:is_debit]
						@daily_accounts << daily_account
					elsif params[:is_debit] == nil || params[:is_debit] == "all"
						@daily_accounts << daily_account
					end									
				rescue Exception => e					
					print "\nis_debit :  #{params[:is_debit]}\n"
					print "\n#{e.message}"
				end
			end

			if Date.today.to_s==params[:uniq_date]
				@can_add_new_entry = true				
				@date = Date.today.strftime("%A  %d %B %Y")
			else
				@date = Date.parse(params[:uniq_date]).strftime("%A  %d %B %Y")
			end
		else			
			@daily_accounts = DailyAccount.all
		end

		@new_daily_account = DailyAccount.new
		@total_amount = DailyAccount.total_amount(@daily_accounts)
	end

	def create
		@new_daily_account = DailyAccount.new(create_daily_account_param)
		if @new_daily_account.save
			redirect_to daily_accounts_path(:uniq_date => Date.today)
		else
			@errors = []
			@new_daily_account.errors.full_messages.each do |msg| 
				@errors << msg
			end 
			print "This is error message : "
			print @errors
			print "\n"
			redirect_to daily_accounts_path(:uniq_date => Date.today, :errors => @errors, :is_debit => params[:is_debit])
		end	
	end

	def new
	end

	def edit
		@daily_account = DailyAccount.find(params[:id])
	end

	def show

	end

	def update
		@daily_account = DailyAccount.find(params[:id])
		if @daily_account.update_attributes(create_daily_account_param)
			redirect_to daily_accounts_path(:uniq_date => Date.today, :is_debit => params[:is_debit])
		else
			render 'edit'			
		end
	end

	def destroy
		DailyAccount.find(params[:id]).destroy
		redirect_to daily_accounts_path
	end
	private
		def daily_account_params
			params.require(:daily_account).permit(:category_spend, :amount, :note, :to_whome, :from_whom, :uniq_date, :account_type_id, :errors, :is_debit)
			
		end
		def create_daily_account_param
			params.require(:daily_account).permit(:category_spend, :amount, :note, :to_whome, :from_whom, :uniq_date, :account_type_id)
		end

end



