class DailyAccountsController < ApplicationController

	def index

		@can_add_new_entry = false
		if params[:uniq_date] != nil
			@date = Date.parse(params[:uniq_date]).strftime("%A  %d %B %Y")
			@daily_accounts = DailyAccount.where(:date => params[:uniq_date])
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
		@total_amount = DailyAccount.total_amount(@daily_accountsssss)
	end

	def create
		@daily_account = DailyAccount.new(daily_account_params)
		if @daily_account.save
			redirect_to daily_accounts_path(:uniq_date => Date.today)
		else
			@errors = []
			@daily_account.errors.full_messages.each do |msg| 
				@errors << msg
			end 
			print "This is error message : "
			print @errors
			print "\n"
			redirect_to daily_accounts_path(:uniq_date => Date.today, :errors => @errors)
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
		if @daily_account.update_attributes(daily_account_params)
			redirect_to daily_accounts_path(:uniq_date => Date.today)
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
			params.require(:daily_account).permit(:category_spend, :amount, :note, :to_whome, :from_whom, :uniq_date, :account_type_id, :errors)
			
		end
end



